import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

admin.initializeApp();

enum OrderStatus {
  placed = "placed",
  confirmed = "confirmed",
  preparing = "preparing",
  onTheWay = "onTheWay",
  delivered = "delivered",
  cancelled = "cancelled",
}

/**
 * Generate order status string base on OrderStatus.
 * @param {string} status status string from firestore
 * @return {string} Order status sentence for client
 */
function orderStatusToMessage(status: string): string {
  switch (status) {
    case OrderStatus.placed:
      return "Your order is successfully placed";
    case OrderStatus.confirmed:
      return "Your order is confirmed";
    case OrderStatus.preparing:
      return "Your order is preparing";
    case OrderStatus.onTheWay:
      return "Shipper has take your order";
    case OrderStatus.delivered:
      return "Your order is successfully delivered";
    case OrderStatus.cancelled:
      return "Order is canceled by your request";
  }
  return "";
}

/**
 * Function in cloud functions.
 */
export const notificationTrigger = functions
  .region("asia-east2").firestore.document("users/{userId}/orders/{ordersId}")
  .onWrite((handler, context) => sendNotification(handler, context));


/**
 * Send notification for client.
 * 
 */
async function sendNotification(handler: functions.Change<functions.firestore.DocumentSnapshot>,
  context: functions.EventContext) {
  const userId = context.params.userId;
  let tokenSnapshot = await admin.firestore().collection("notification_tokens").doc(userId).get();
  const fcmToken = tokenSnapshot.get("token") as string;

  let order = handler.after.data()!;
  const statusMessage = orderStatusToMessage(order["status"]);

  if (statusMessage === "") return;

  const message = {
    "notification": {
      "title": "Order",
      "body": statusMessage,
    },
    "token": fcmToken
  };

  admin.messaging().send(message);
}