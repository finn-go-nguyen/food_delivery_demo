import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../constants/ui/ui_parameters.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../repositories/users/coordinate.dart';
import '../../../../widgets/buttons/icon_button.dart';
import '../../../cubits/app/app_cubit.dart';
import '../../cubit/sign_up_cubit.dart';
import 'cubit/map_screen_cubit.dart';
import 'widgets/address_search_bar.dart';
import 'widgets/set_location_button.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    required this.lat,
    required this.lon,
    this.isSigningUp = false,
  });

  final double lat;
  final double lon;
  final bool isSigningUp;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final _cubit = GetIt.I<MapScreenCubit>();
  final _searchTextEditingController = TextEditingController();
  late final LatLng _center;
  late GoogleMapController _mapController;
  Timer? timer;
  String oldQuery = '';

  @override
  void initState() {
    super.initState();
    _center = LatLng(widget.lat, widget.lon);
    _cubit.onCoordinateChanged(widget.lat, widget.lon);
    _searchTextEditingController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    timer?.cancel();
    _mapController.dispose();
    _searchTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              GoogleMap(
                onMapCreated: _onMapCreated,
                zoomControlsEnabled: false,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 16.0,
                ),
                onTap: (argument) => {
                  log('tap: ${argument.toJson()}'),
                },
                onCameraMove: _onCameraMove,
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 40.0),
                  child: Icon(
                    Icons.location_pin,
                    color: Colors.red,
                    size: 50.0,
                  ),
                ),
              ),
              Positioned(
                bottom: 0.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: FIconRounded(
                        onPressed: () {
                          _moveToLocation(widget.lat, widget.lon);
                        },
                        icon: const FittedBox(
                          child: Icon(
                            Icons.explore_outlined,
                            color: Colors.green,
                            size: 50,
                          ),
                        ),
                      ),
                    ),
                    BlocBuilder<MapScreenCubit, MapScreenState>(
                      buildWhen: (previous, current) =>
                          previous.status != current.status ||
                          previous.lat != current.lat ||
                          previous.lon != current.lon,
                      builder: (context, state) {
                        return SetLocationButton(
                          isLoading: state.status.isLoading,
                          onPressed: () {
                            widget.isSigningUp
                                ? context
                                    .read<SignUpCubit>()
                                    .onSetLocationButtonPressed(
                                        state.lat!, state.lon!, state.address!)
                                : context.read<AppCubit>().updateUserState(
                                      context
                                          .read<AppCubit>()
                                          .state
                                          .user!
                                          .copyWith(
                                        coordinates: [
                                          Coordinate(
                                            latitude: state.lat!,
                                            longitude: state.lon!,
                                            address: state.address!,
                                          )
                                        ],
                                      ),
                                    );
                            Navigator.pop(context);
                          },
                          location: state.address,
                        );
                      },
                    ),
                  ],
                ),
              ),
              Positioned(
                child: Padding(
                  padding: Ui.screenPadding,
                  child: BlocBuilder<MapScreenCubit, MapScreenState>(
                    buildWhen: (previous, current) =>
                        previous.suggestions != current.suggestions,
                    builder: (context, state) {
                      return AddressSearchBar(
                        controller: _searchTextEditingController,
                        suggestions: state.suggestions,
                        onTitleTapped: (place) {
                          _cubit.onTitleTapped(place.latitude, place.longitude);
                          _moveToLocation(place.latitude, place.longitude);
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) async {
    _mapController = controller;
    final style = await DefaultAssetBundle.of(context)
        .loadString(Assets.mapstyles.mapstyleDefault);
    _mapController.setMapStyle(style);
  }

  void _moveToLocation(double latitude, double longitude) {
    _mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(latitude, longitude),
          zoom: 18.0,
        ),
      ),
    );
  }

  void _onCameraMove(CameraPosition position) {
    // Dismiss keyboard
    FocusManager.instance.primaryFocus?.unfocus();
    timer?.cancel();
    timer = Timer(const Duration(milliseconds: 500), () {
      _cubit.onCoordinateChanged(
          position.target.latitude, position.target.longitude);
    });
  }

  void _onSearchChanged() {
    timer?.cancel();
    timer = Timer(const Duration(milliseconds: 500), () {
      final newQuery = _searchTextEditingController.text.trim();
      if (newQuery == oldQuery) return;
      _cubit.onSearchChanged(newQuery, widget.lat, widget.lon);
    });
  }
}
