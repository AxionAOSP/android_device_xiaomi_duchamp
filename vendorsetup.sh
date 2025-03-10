# 1. Apply Git Changes (Source Modification)
echo "Applying source modifications..."

# UDFPS Patch for frameworks/base
echo "Fetching and applying UDFPS patch for frameworks/base..."
cd frameworks/base
git fetch https://github.com/xiaomi-mt6897-duchamp/axion-1.2_frameworks_base
git cherry-pick 5622493fe96301728fa2d409edd3ce8e7225ade7 596798032f7fa5445ca96626aeb3df7c6acdf624
cd ../../

# Hardware Compatibility Fixes
echo "Fetching and applying hardware compatibility fixes for hardware/lineage/compat..."
cd hardware/lineage/compat
git fetch https://github.com/xiaomi-mt6897-duchamp/android_hardware_lineage_compat
git cherry-pick 9a046ea7e5899adc38ab04fe24eb34859fe4d779
cd ../../../

# Hardware Legacy Modifications
echo "Fetching and applying fixes for hardware/libhardware_legacy..."
cd hardware/libhardware_legacy
git fetch https://android.googlesource.com/platform/hardware/libhardware_legacy 54bb5d03278152e696c7bff4607278790ac73057
git cherry-pick 54bb5d03278152e696c7bff4607278790ac73057
cd ../../

# Nuke refresh rate selector
echo "Nuking refresh rate selector so no one mess with it..."
cd  packages/apps/Settings
git fetch https://github.com/xiaomi-mt6897-duchamp/axion_packages_apps_Settings
git cherry-pick 1d32364392c4027cd04852c684a66d8cdd6cfb1d
cd ../../../

# Add WPA3 fix patch
echo "Patching WPA3 to work on duchamp device..."
cd external/wpa_supplicant_8
git fetch https://github.com/xiaomi-mt6897-duchamp/android_external_wpa_supplicant_8
git cherry-pick cc88629c6c5c2c2353bf87efef9b5c9c5bf32bee
cd ../../

echo "All operations completed successfully!"
