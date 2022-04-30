echo
echo "Initialization | WiFuck"
echo
echo "  Cloning WiFuck..."
echo
git clone https://github.com/Retr0Kr0dy/wifuck tools/wifuck
echo
echo "  Creating WiFuck executable file in /home/KrdTools/"
echo
cp tools/wifuck/WiFuck.py /bin/wifuck
chmod a+x /bin/wifuck
