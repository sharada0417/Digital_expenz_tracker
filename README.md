# Digital Expense Tracker 

**Digital Expense Tracker** is a Flutter-based mobile application designed to help users **track their incomes and expenses efficiently**, manage budgets, and maintain a clear overview of their financial activities. The app leverages **Shared Preferences** for secure local storage and provides a clean, interactive user interface with charts and cards for easy visualization.

---

## 🏆 Features

### 1️⃣ Login & User Management
- Users can **log in** with a username and password.
- User credentials are stored locally using **Shared Preferences**.
- Ensures **persistent login** until the user chooses to log out.

### 2️⃣ Main Dashboard
- Displays a **summary of incomes and expenses**.
- Shows **transaction cards** for recent incomes and expenses.
- Swipe to **remove any income or expense** easily.
- Provides quick access to add new transactions.

### 3️⃣ Add New Transactions
- **Income Form**: Add new income with details like amount, date, and description.
- **Expense Form**: Add new expense with details like amount, category, date, and description.
- Forms validate input to ensure accurate records.

### 4️⃣ Budget Screen
- Shows **total incomes vs total expenses** in a **Bar Chart**.
- Allows users to analyze spending patterns and budget performance.
- Provides clear visualization of financial data over time.

### 5️⃣ Profile Screen
- Displays **user details** such as username and email.
- **Edit button** for future user profile enhancements.
- **Logout button** triggers a confirmation modal:
  - **Yes** → Clears all user data, incomes, and expenses from **Shared Preferences** and navigates to login/onboarding.
  - **No** → Closes the modal without logging out.

### 6️⃣ Data Persistence
- Uses **Shared Preferences** to store:
  - Username and password
  - Incomes
  - Expenses
- Ensures all data is **locally available**, even after closing the app.

---

## 📱 Screens Overview

| Screen              | Description                                                                 |
|--------------------|-----------------------------------------------------------------------------|
| **Login Screen**     | Authenticate user and save credentials locally.                             |
| **Main Screen**      | Overview of all incomes, expenses, and transaction cards.                  |
| **Add Transaction**  | Forms for adding incomes or expenses with validation.                      |
| **Budget Screen**    | Visualize all transactions with bar charts for easy tracking.             |
| **Profile Screen**   | Show user information and provide logout option with confirmation.        |

---

## ⚡ How It Works

1. **Login Flow**
   - User enters username and password.
   - App saves credentials in **Shared Preferences**.
   - Navigates to the **Main Dashboard**.

2. **Transaction Management**
   - User can **add incomes and expenses** via forms.
   - Transactions are displayed as **cards** on the main screen.
   - **Swipe gestures** allow quick deletion of individual transactions.

3. **Budget Visualization**
   - Bar charts dynamically display income vs expense totals.
   - Helps users track spending habits and adjust their budgets.

4. **Profile & Logout**
   - Profile screen shows username, email, and actions.
   - **Logout confirmation** ensures accidental logouts are avoided.
   - Confirming logout deletes **all saved data** and returns to login.

---

## 🛠️ Technology Stack
- **Flutter** → For cross-platform mobile development.
- **Dart** → Programming language.
- **Shared Preferences** → For local storage of user credentials and transactions.
- **Charts** → Visual representation of budget and expenses.
- **Material Design** → Clean and responsive UI.

---

## 🎨 UI/UX Highlights
- Modern Material Design for easy navigation.
- Interactive cards for income and expense items.
- Smooth swipe-to-delete functionality.
- Bar charts for visual insights into financial data.
- Confirmation dialogs for secure logout.

## 💡 Future Enhancements
- Add categories and filters for expenses.
- Add notifications for budget limits.
- Enable cloud sync for cross-device access.
- Allow editing transactions directly from cards.
- Enhance profile editing with profile picture and settings.

## 📌 Notes
- Ensure you have all assets (images/icons) correctly placed to avoid runtime errors.
- The app uses local storage only; no backend or cloud database integration is included.
- Swipe-to-delete requires gesture handling on cards; ensure smooth animations for better UX.

## 🎯 Summary
Digital Expense Tracker is a user-friendly, secure, and visually appealing app to manage personal finances. It combines transaction tracking, budget visualization, and profile management in one seamless Flutter application.

## Outputs
![photo_2025-08-13_20-06-42](https://github.com/user-attachments/assets/4fbaa068-9ce3-44cc-a44b-32148a45d4f1)

![photo_2025-08-13_20-06-47](https://github.com/user-attachments/assets/32044676-89b3-47b9-9de7-a49aedf9ac32)

![photo_2025-08-13_20-06-49](https://github.com/user-attachments/assets/02dc9786-c049-48a8-8834-2f3ae2cd76f9)

![photo_2025-08-13_20-06-55](https://github.com/user-attachments/assets/27992757-ef08-4abc-b24e-c5d1f394b60f)

![photo_2025-08-13_20-06-56](https://github.com/user-attachments/assets/d105cf3b-a13b-40f9-b804-382d095b6afe)

![photo_2025-08-13_20-06-58](https://github.com/user-attachments/assets/2a43c6de-9bfb-4315-b94d-a1d9f9e7c4f7)

![photo_2025-08-13_20-07-00](https://github.com/user-attachments/assets/926b462b-60b2-4a1a-a6b4-315f5d8462a9)

![photo_2025-08-13_20-07-02](https://github.com/user-attachments/assets/6f0ee70e-1772-45d7-bfde-ee33e8b92a7c)

![photo_2025-08-13_20-07-04](https://github.com/user-attachments/assets/74c5effc-b2ed-43e0-8809-8001f88bb943)

![photo_2025-08-13_20-07-06](https://github.com/user-attachments/assets/c6d8ecf8-6a4b-45bd-83a2-10d51649deff)

![photo_2025-08-13_20-07-08](https://github.com/user-attachments/assets/5b02c4fb-69ae-47cf-b7c9-9f1ea358de9f)

