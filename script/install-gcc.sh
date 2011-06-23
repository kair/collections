GMP=gmp-4.3.2
MPFR=mpfr-2.4.2
MPC=mpc-0.8.1
GCC=gcc-4.6.0
for i in $GMP.tar.bz2 $MPFR.tar.bz2 $MPC.tar.gz
do
  wget ftp://ftp.dti.ad.jp/pub/lang/gcc/infrastructure/$i
  tar -xvf $i
done
cd $GMP
./configure --prefix=/usr/local/$GMP
make
sudo make install
cd ..
cd $MPFR
./configure --prefix=/usr/local/$MPFR --with-gmp=/usr/local/$GMP
make
sudo make install
cd ..
cd $MPC
./configure --prefix=/usr/local/$MPC --with-gmp=/usr/local/$GMP --with-mpfr=/usr/local/$MPFR
make
sudo make install
cd ..
cd $GCC-obj
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/mpc-0.8.1/lib:/usr/local/gmp-4.3.2/lib:/usr/local/mpfr-2.4.2/lib
../$GCC/configure --prefix=/usr/local/gcc-4.6.0 --enable-threads=posix --disable-checking --disable-multilib --enable-languages=c,c++ --with-gmp=/usr/local/gmp-4.3.2 --with-mpfr=/usr/local/mpfr-2.4.2 --with-mpc=/usr/local/mpc-0.8.1
make -j 4
sudo make install
cd ..
