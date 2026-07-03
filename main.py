"""
main.py
ชุดคำสั่ง Python สำหรับควบคุมตรรกะระบบโรงอาหาร ATC
"""


def process_payment(wallet_balance, item_price):
    if wallet_balance >= item_price:
        new_balance = wallet_balance - item_price
        print(f"ชำระเงินสำเร็จ: หัก {item_price:.2f} บาท | คงเหลือ {new_balance:.2f} บาท")
        return new_balance
    else:
        print(f"Error: ยอดเงินใน Wallet ไม่เพียงพอ (มี {wallet_balance:.2f} บาท ต้องการ {item_price:.2f} บาท)")
        return wallet_balance


def display_active_queues(queue_list):
    print("===== คิวที่กำลังดำเนินการ (Pending) =====")
    found = False
    for queue in queue_list:
        if queue.get("Status") == "Pending":
            found = True
            print(f"Queue ID: {queue['Queue_ID']} | Menu: {queue['Menu']} | "
                  f"Total Price: {queue['Total_Price']:.2f} | Status: {queue['Status']}")
    if not found:
        print("ไม่มีคิวที่อยู่ในสถานะ Pending")
    print("==========================================")


if __name__ == "__main__":
    wallet_balance = 100.00
    wallet_balance = process_payment(wallet_balance, 45.00)
    wallet_balance = process_payment(wallet_balance, 200.00)

    orders = [
        {"Queue_ID": 101, "Menu": "Pad Krapow Moo Saap", "Total_Price": 45.00, "Status": "Ready"},
        {"Queue_ID": 102, "Menu": "Tom Yum Kung", "Total_Price": 60.00, "Status": "Pending"},
        {"Queue_ID": 103, "Menu": "Khao Man Kai", "Total_Price": 40.00, "Status": "Pending"},
        {"Queue_ID": 104, "Menu": "Som Tum", "Total_Price": 35.00, "Status": "Ready"},
    ]

    display_active_queues(orders)