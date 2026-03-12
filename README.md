# 🔑 WiFi-Password-Recovery-Batch

A lightweight, professional batch script to retrieve and display all saved Wi-Fi profiles and passwords on a Windows machine.

## 🚀 Features
* **Auto-Elevation:** Automatically requests Administrator privileges.
* **UTF-8 Support:** Correctly displays SSIDs with special characters (Hebrew, Cyrillic, Emojis).
* **Formatted Output:** Clean, tabular view of Network Name, Password, Authentication, and Cipher.
* **Efficiency:** Optimized `netsh` queries for fast execution.

## 🛠️ Usage
1. Download the `wifi_recovery.bat` file.
2. Right-click and **Run as Administrator** (or let the script prompt you).
3. View your saved passwords instantly.

---

## 🖥️ Simulation (Example Output)

=====================================================================================================
    WI-FI SAVED PASSWORDS AND NETWORK CONFIGURATION
=====================================================================================================
 NETWORK NAME                   | PASSWORD                  | AUTH            | CIPHER
-----------------------------------------------------------------------------------------------------
 Home_Fiber_5G                  | SuperSecret123            | WPA2-Personal   | CCMP
 Coffee_Shop_Free               | [OPEN / NO KEY]           | Open            | None
 Israel_Guest_Net               | Welcome2026!              | WPA2-Personal   | CCMP
 Office_Main_Floor              | AdminPass99               | WPA2-Personal   | CCMP
 Tech_Support_Hub               | #Connect@2025             | WPA3-Personal   | GCMP
 My_Phone_Hotspot               | pass12345                 | WPA2-Personal   | CCMP
 Hotel_Azure_WLAN               | Guest_Pass_88             | WPA2-Personal   | CCMP
 Private_Cloud_AP               | HiddenKey!                | WPA2-Personal   | CCMP
 שלום_עולם_WiFi                 | Israel_Rocks              | WPA2-Personal   | CCMP
 Cyber_Lab_Alpha                | B@tch_Script_Pro          | WPA2-Personal   | CCMP
-----------------------------------------------------------------------------------------------------
 [SUCCESS] Total scan finished.

 Press any key to continue . . .

---

## ⚠️ Disclaimer
This tool is for educational and administrative purposes only. Only use it on systems you own or have explicit permission to audit.

## ⚖️ License
This project is licensed under the MIT License - see the LICENSE file for details.
