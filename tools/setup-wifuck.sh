echo
echo "Initialization | WiFuck"
echo
echo "  Cloning WiFuck..."
echo
git clone https://github.com/Retr0Kr0dy/wifuck tools/wifuck
echo
echo "  Creating WiFuck executable file in /usr/local/bin"
echo
cp tools/wifuck/WiFuck.py /usr/local/bin/wifuck
chmod a+x /usr/local/bin/wifuck
