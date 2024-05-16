#!/bin/bash

# Function to install Dart packages
install_packages() {
  echo "Installing packages for $1..."
  dart pub get
  echo "Packages installed for $1"
}

install_packages
# Install packages for booking_auth
cd packages/booking_auth
install_packages "booking_auth"
 flutter pub run build_runner build --delete-conflicting-outputs

# Install packages for booking_home
cd ../booking_home
install_packages "booking_home"
 flutter pub run build_runner build --delete-conflicting-outputs

# Install packages for booking_profile
cd ../booking_profile
install_packages "booking_profile"
 flutter pub run build_runner build --delete-conflicting-outputs

echo "All packages installed successfully!"