echo
echo "Initialization | WiFuck-rpi"
echo
echo "  Cloning WiFuck..."
echo
git clone https://github.com/Retr0Kr0dy/wifuck tools/wifuck
echo
echo "  Creating WiFuck-rpi executable file in /bin"
echo
cp tools/wifuck/WiFuck-rpi.py /bin/wifuck-rpi
chmod a+x /bin/wifuck-rpi
