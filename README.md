# 📦 SmartFab Material Tracking & Costing App

A Flutter-based Material Tracking & Costing app built for **SmartFab Industries** to streamline production workflows, eliminate manual logs, automate cost calculations, and enforce secure role-based access control.

---

## 📌 Problem Statement

At SmartFab Industries, manual material logs and disconnected spreadsheets cause:

- Stock discrepancies & lost inventory records
- Delayed or inaccurate cost and price calculations
- Unauthorized access & accidental data edits
- No real-time visibility into material usage or stock levels

---

## ✅ Solution Overview

This app provides a complete Flutter frontend prototype with:

- 🔒 **Role-Based Access Control (RBAC)**
- 📲 **QR/Barcode Material Scanning**
- 📉 **Automated Cost & Price Calculations**
- 🔌 **Offline Support via Hive/SQLite**
- ☁️ **Cloud Sync with Firebase (optional integration)**
- 📊 **Admin Dashboards, Analytics & Exportable Reports**

---

## 👤 User Roles

| Role     | Permissions |
|----------|-------------|
| **Admin**    | Add/Edit/Delete materials, processes, users, view dashboards, cost reports, and export logs |
| **Operator** | Scan materials, log usage, view assigned operations only |

---

## 🔧 Features

### 🧾 Real-Time Material Tracking
- QR/barcode scan to auto-fetch material details (name, cost, stock, unit)
- Offline scan caching using **Hive** or **SQLite**
- Auto-sync with cloud when reconnected

### 📊 Cost Calculation Automation
- `Raw Material Cost = Unit Cost × Quantity`
- `Manufacturing Cost = Raw Cost + Labor + Energy`
- `Final Price = Manufacturing Cost + Margin`
- Suggests selling price & calculates profit per unit

### 📦 Inventory Management
- Real-time stock level updates per consumption log
- Low-stock alerts (Admin only)
- Searchable consumption history by date/material

### 📤 Reports & Export
- Viewable cost breakdown reports
- Export logs as PDF or CSV for external analysis

### 🛡️ Secure & Offline-Ready
- Full **RBAC system**
- Offline-first architecture
- **Local caching** with sync support
- Clean architecture and maintainable codebase

---

## 🛠️ Tech Stack

- **Flutter 3.x** with Material UI
- **State Management**: `Provider` (can be replaced with Riverpod or Bloc)
- **Offline DB**: Hive (or SQLite)
- **Cloud Backend** (optional): Firebase Firestore
- **QR/Barcode Scan**: `qr_code_scanner` or `mobile_scanner`
- **File Export**: `pdf`, `csv`, `path_provider`
- **Role Security**: Auth flow, local role-checks

---

