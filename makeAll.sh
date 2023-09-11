i=1
j=1
if [ ! -d "./cadets" ]; then
  mkdir cadets
fi
make build
mv sus-loader.img "./cadets/cadet$j.img"
until [ $i -eq 10 ]
do
  sed -i "s/Cadet$j/Cadet$i/g" 'sus-loader.asm'
  make build
  mv sus-loader.img "./cadets/cadet$i.img"
  j=$((i))
  i=$((i+1))
done
