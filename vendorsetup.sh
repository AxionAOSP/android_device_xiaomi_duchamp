# 1. Apply Git Changes (Source Modification)
echo "Applying source modifications..."

# UDFPS Patch for frameworks/base
echo "Fetching and applying UDFPS patch for frameworks/base..."
cd frameworks/base
git fetch https://github.com/xiaomi-mt6897-duchamp/axion_frameworks_base_new
git cherry-pick b677a71f0ef31567dc4d5332a1fd6575e60cdcba 18485997a67890b3f3b26034b41b1cf657db1e9f
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
echo "Nuking refresh rate selector so no one mess with it"
cd  packages/apps/Settings
git fetch https://github.com/xiaomi-mt6897-duchamp/axion_packages_apps_Settings
git cherry-pick 1d32364392c4027cd04852c684a66d8cdd6cfb1d
cd ../../../

# V4A
git clone https://github.com/xiaomi-mt6897-duchamp/packages_apps_ViPER4AndroidFX.git -b v4a packages/apps/ViPER4AndroidFX
echo "Removing accidentally clone..."
rm -rf packages/yapps/ViPER4AndroidFX

echo "All operations completed successfully!"
