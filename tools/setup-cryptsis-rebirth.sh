echo
echo "Initialization | CryptSIS-rebirth"
echo
echo "  Cloning CryptSIS-rebirth..."
echo
git clone https://github.com/Retr0Kr0dy/CryptSIS-rebirth tools/CryptSIS-rebirth
echo
echo "  Creating CryptSIS-rebirth executable file in /bin"
echo
chmod a+x tools/CryptSIS-rebirth/setup.sh
./tools/CryptSIS-rebirth/setup.sh
cp tools/CryptSIS-rebirth/CryptSIS-rebirth.py /bin/cryptsis-rebirth
chmod a+x /bin/cryptsis-rebirth
