echo
echo "Initialization | WiFuck-rpi"
echo
echo "  Cloning WiFuck..."
echo
git clone https://github.com/Retr0Kr0dy/wifuck
echo
echo "  Creating WiFuck-rpi executable file in /home/KrdTools/"
echo
cp wifuck/WiFuck-rpi.py /bin/wifuck-rpi
chmod a+x /bin/wifuck-rpi
