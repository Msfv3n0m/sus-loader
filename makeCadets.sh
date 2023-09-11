cadets="name1 name2"
if [ ! -d "./tmp" ]; then
  mkdir tmp
fi 
if [ ! -d "./cadets" ]; then
  mkdir cadets
fi 
for cadet in $cadets
do
  cp sus-loader.asm ./tmp/sus-loader.asm
  sed -i "s/Cadet0/$cadet/g" './tmp/sus-loader.asm'
  make buildtmp 
  mv ./tmp/sus-loader/img "./cadets/$cadet.img"
done
rm -rf ./tmp
