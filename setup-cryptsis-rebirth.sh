echo
echo "Initialization | CryptSIS-rebirth"
echo
echo "  Cloning CryptSIS-rebirth..."
echo
git clone https://github.com/Retr0Kr0dy/CryptSIS-rebirth
echo
echo "  Creating CryptSIS-rebirth executable file in /bin"
echo
chmod a+x CryptSIS-rebirth/setup.sh
./CryptSIS-rebirth/setup.sh
cp CryptSIS-rebirth/CryptSIS-rebirth.py /bin/cryptsis-rebirth
chmod a+x /bin/cryptsis-rebirth
