# AMD – Flutter UI Demo Collection

A collection of Flutter demo applications and UI component examples for learning Flutter fundamentals.

## What's Inside

This repository contains standalone Dart/Flutter files, each demonstrating a different UI pattern or feature:

| File | Description |
|------|-------------|
| [`apppointment.dart`](apppointment.dart) | Appointment booking with date selection and time-slot management |
| [`attendence.dart`](attendence.dart) | Student attendance tracker (mark present/absent across multiple classes) |
| [`booking.dart`](booking.dart) | Auditorium seat booking with pricing tiers and revenue calculation |
| [`bulbs.dart`](bulbs.dart) | Smart-home bulb control demo (toggle lights on/off via checkboxes) |
| [`checkBoxListTile.dart`](checkBoxListTile.dart) | Food-ordering form with "Select All" checkbox and running total |
| [`datePicker.dart`](datePicker.dart) | Form combining a date picker, dropdown, checkboxes, and text-input validation |
| [`emi.dart`](emi.dart) | EMI (Equated Monthly Installment) calculator using three sliders |
| [`flutturForm.dart`](flutturForm.dart) | Student registration form (ID, date of birth, skills) |
| [`forms.dart`](forms.dart) | Registration form with radio buttons (gender) and checkboxes (languages) |
| [`ListView.dart`](ListView.dart) | Dynamic list generation – enter a range and display numbers with `ListView.builder` |
| [`slidebar.dart`](slidebar.dart) | Three-slider widget that highlights the maximum of the three values |
| [`stateCityRadio.dart`](stateCityRadio.dart) | Cascading State → City radio-button selection |
| [`table.dart`](table.dart) | Food-shop sales table with inventory tracking and dynamic calculations |
| [`tabsWithImg.dart`](tabsWithImg.dart) | Tabbed layout with images loaded from the `assets/images/` folder |

### Login Flows

| Folder | Description |
|--------|-------------|
| [`Login/`](Login/) | Simple username/password login (`admin` / `admin`) with a welcome screen |
| [`Login3Screen/`](Login3Screen/) | 4-digit PIN login spread across three screens (login → welcome / error) |

### Assets

- `assets/images/` – six sample PNG images (`img1.png` – `img6.png`) used by `tabsWithImg.dart`

## Topics Covered

- **Forms & Validation** – `TextFormField`, `Form`, controllers, validators
- **State Management** – `StatefulWidget` + `setState`
- **Navigation & Routing** – named routes, `Navigator.pushNamed`
- **Lists & Builders** – `ListView`, `ListView.builder`, `CheckboxListTile`
- **Date & Time** – `showDatePicker`, `DateTimeField`
- **Sliders** – `Slider` widget for numeric input
- **Tables** – `DataTable`, `DataRow`, `DataCell`
- **Tabs** – `TabBar` + `TabBarView`
- **Business Logic** – EMI formula, seat-booking revenue, attendance statistics

## Getting Started

1. **Prerequisites** – Install [Flutter](https://docs.flutter.dev/get-started/install) (stable channel).
2. **Copy a demo file** into a Flutter project's `lib/` directory (e.g. `lib/main.dart`).
3. Add any required assets to `pubspec.yaml` if the demo uses images.
4. Run with `flutter run`.

> Each `.dart` file is a self-contained app with its own `void main()` entry point.

## License

This project is open-source and available for learning purposes.
