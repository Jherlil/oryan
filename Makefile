default:
	g++ -m64 -march=native -mtune=native -mavx2 -msha -Wall -Wextra -Wno-deprecated-copy -Ofast -ftree-vectorize -flto -c oldbloom/bloom.cpp -o oldbloom.o
	g++ -m64 -march=native -mtune=native -mavx2 -msha -Wall -Wextra -Wno-deprecated-copy -Ofast -ftree-vectorize -flto -c bloom/bloom.cpp -o bloom.o
	gcc -m64 -march=native -mtune=native -mavx2 -msha -Wall -Wextra -Wno-unused-parameter -Ofast -ftree-vectorize -c base58/base58.c -o base58.o
	g++ -m64 -march=native -mtune=native -mavx2 -msha -Wall -Wextra -Wno-deprecated-copy -Ofast -ftree-vectorize -c CryptoUtil/ripemd160.cpp -o hash/ripemd160.o
	g++ -m64 -march=native -mtune=native -mavx2 -msha -Wall -Wextra -Wno-deprecated-copy -Ofast -ftree-vectorize -c sha3/sha3.c -o sha3.o
	g++ -m64 -march=native -mtune=native -mavx2 -msha -Wall -Wextra -Wno-deprecated-copy -Ofast -ftree-vectorize -c sha3/keccak.c -o keccak.o
	gcc -m64 -march=native -mtune=native -mavx2 -msha -Wall -Wextra -Ofast -ftree-vectorize -c xxhash/xxhash.c -o xxhash.o
	g++ -m64 -march=native -mtune=native -mavx2 -msha -Wall -Wextra -Wno-deprecated-copy -Ofast -ftree-vectorize -c util.c -o util.o
	g++ -m64 -march=native -mtune=native -mavx2 -msha -Wall -Wextra -Wno-deprecated-copy -Ofast -ftree-vectorize -c gmp256k1/Int.cpp -o Int.o
	g++ -m64 -march=native -mtune=native -mavx2 -msha -Wall -Wextra -Wno-deprecated-copy -Ofast -ftree-vectorize -c gmp256k1/Point.cpp -o Point.o
	g++ -m64 -march=native -mtune=native -mavx2 -msha -Wall -Wextra -Wno-deprecated-copy -Ofast -ftree-vectorize -c gmp256k1/GMP256K1.cpp -o SECP256K1.o
	g++ -m64 -march=native -mtune=native -mavx2 -msha -Wall -Wextra -Wno-deprecated-copy -Ofast -ftree-vectorize -c gmp256k1/IntMod.cpp -o IntMod.o
	g++ -m64 -march=native -mtune=native -mavx2 -msha -Wall -Wextra -Wno-deprecated-copy -Ofast -ftree-vectorize -flto -c gmp256k1/Random.cpp -o Random.o
	g++ -m64 -march=native -mtune=native -mavx2 -msha -Wall -Wextra -Wno-deprecated-copy -Ofast -ftree-vectorize -flto -c gmp256k1/IntGroup.cpp -o IntGroup.o
	gcc -m64 -march=native -mtune=native -mavx2 -msha -Wall -Wextra -Ofast -ftree-vectorize -flto -c hash/flo-shani.c -o hash/flo-shani.o
	       g++ -m64 -march=native -mtune=native -mavx2 -msha -Wall -Wextra -Wno-deprecated-copy -Ofast -ftree-vectorize -o keyhunt keyhunt.cpp base58.o hash/ripemd160.o hash/flo-shani.o bloom.o oldbloom.o xxhash.o util.o Int.o Point.o SECP256K1.o IntMod.o Random.o IntGroup.o sha3.o keccak.o -lm -lpthread -ljemalloc
	rm -r *.o
clean:
	rm keyhunt

hash/flo-shani.o: hash/flo-shani.c hash/flo-shani.h
	gcc -m64 -march=native -mtune=native -mavx2 -msha -Wall -Wextra -Ofast -ftree-vectorize -flto -c $< -o $@

hash/ripemd160.o: CryptoUtil/ripemd160.cpp CryptoUtil/CryptoUtil.h
	g++ -m64 -march=native -mtune=native -mavx2 -msha -Wall -Wextra -Wno-deprecated-copy -Ofast -ftree-vectorize -flto -c $< -o $@
legacy:
	g++ -march=native -mtune=native -Wall -Wextra -Ofast -ftree-vectorize -flto -c oldbloom/bloom.cpp -o oldbloom.o
	g++ -march=native -mtune=native -Wall -Wextra -Ofast -ftree-vectorize -flto -c bloom/bloom.cpp -o bloom.o
	gcc -march=native -mtune=native -Wno-unused-result -Ofast -ftree-vectorize -c base58/base58.c -o base58.o
	gcc -march=native -mtune=native -Wall -Wextra -Ofast -ftree-vectorize -c xxhash/xxhash.c -o xxhash.o
	g++ -march=native -mtune=native -Wall -Wextra -Ofast -ftree-vectorize -c util.c -o util.o
	g++ -march=native -mtune=native -Wall -Wextra -Ofast -ftree-vectorize -c sha3/sha3.c -o sha3.o
	g++ -march=native -mtune=native -Wall -Wextra -Ofast -ftree-vectorize -c sha3/keccak.c -o keccak.o
	g++ -march=native -mtune=native -Wall -Wextra -Ofast -ftree-vectorize -c hashing.c -o hashing.o
	g++ -march=native -mtune=native -Wall -Wextra -Ofast -ftree-vectorize -c gmp256k1/Int.cpp -o Int.o
	g++ -march=native -mtune=native -Wall -Wextra -Ofast -ftree-vectorize -c gmp256k1/Point.cpp -o Point.o
	g++ -march=native -mtune=native -Wall -Wextra -Ofast -ftree-vectorize -c gmp256k1/GMP256K1.cpp -o GMP256K1.o
	g++ -march=native -mtune=native -Wall -Wextra -Ofast -ftree-vectorize -c gmp256k1/IntMod.cpp -o IntMod.o
	g++ -march=native -mtune=native -Wall -Wextra -Ofast -ftree-vectorize -flto -c gmp256k1/Random.cpp -o Random.o
	g++ -march=native -mtune=native -Wall -Wextra -Ofast -ftree-vectorize -flto -c gmp256k1/IntGroup.cpp -o IntGroup.o
	g++ -march=native -mtune=native -Wall -Wextra -Ofast -ftree-vectorize -o keyhunt keyhunt_legacy.cpp base58.o bloom.o oldbloom.o xxhash.o util.o Int.o  Point.o GMP256K1.o  IntMod.o  IntGroup.o Random.o hashing.o sha3.o keccak.o -lm -lpthread -ljemalloc -lcrypto -lgmp	
	rm -r *.o
bsgsd:
	g++ -m64 -march=native -mtune=native -mavx2 -msha -Wall -Wextra -Wno-deprecated-copy -Ofast -ftree-vectorize -flto -c oldbloom/bloom.cpp -o oldbloom.o
	g++ -m64 -march=native -mtune=native -mavx2 -msha -Wall -Wextra -Wno-deprecated-copy -Ofast -ftree-vectorize -flto -c bloom/bloom.cpp -o bloom.o
	gcc -m64 -march=native -mtune=native -mavx2 -msha -Wall -Wextra -Wno-unused-parameter -Ofast -ftree-vectorize -c base58/base58.c -o base58.o
	g++ -m64 -march=native -mtune=native -mavx2 -msha -Wall -Wextra -Wno-deprecated-copy -Ofast -ftree-vectorize -c CryptoUtil/ripemd160.cpp -o hash/ripemd160.o
	g++ -m64 -march=native -mtune=native -mavx2 -msha -Wall -Wextra -Wno-deprecated-copy -Ofast -ftree-vectorize -c sha3/sha3.c -o sha3.o
	g++ -m64 -march=native -mtune=native -mavx2 -msha -Wall -Wextra -Wno-deprecated-copy -Ofast -ftree-vectorize -c sha3/keccak.c -o keccak.o
	gcc -m64 -march=native -mtune=native -mavx2 -msha -Wall -Wextra -Ofast -ftree-vectorize -c xxhash/xxhash.c -o xxhash.o
	g++ -m64 -march=native -mtune=native -mavx2 -msha -Wall -Wextra -Wno-deprecated-copy -Ofast -ftree-vectorize -c util.c -o util.o
	g++ -m64 -march=native -mtune=native -mavx2 -msha -Wall -Wextra -Wno-deprecated-copy -Ofast -ftree-vectorize -c gmp256k1/Int.cpp -o Int.o
	g++ -m64 -march=native -mtune=native -mavx2 -msha -Wall -Wextra -Wno-deprecated-copy -Ofast -ftree-vectorize -c gmp256k1/Point.cpp -o Point.o
	g++ -m64 -march=native -mtune=native -mavx2 -msha -Wall -Wextra -Wno-deprecated-copy -Ofast -ftree-vectorize -c gmp256k1/GMP256K1.cpp -o SECP256K1.o
	g++ -m64 -march=native -mtune=native -mavx2 -msha -Wall -Wextra -Wno-deprecated-copy -Ofast -ftree-vectorize -c gmp256k1/IntMod.cpp -o IntMod.o
	g++ -m64 -march=native -mtune=native -mavx2 -msha -Wall -Wextra -Wno-deprecated-copy -Ofast -ftree-vectorize -flto -c gmp256k1/Random.cpp -o Random.o
	g++ -m64 -march=native -mtune=native -mavx2 -msha -Wall -Wextra -Wno-deprecated-copy -Ofast -ftree-vectorize -flto -c gmp256k1/IntGroup.cpp -o IntGroup.o
	g++ -m64 -march=native -mtune=native -mavx2 -msha -Wall -Wextra -Wno-deprecated-copy -Ofast -ftree-vectorize -flto -c CryptoUtil/ripemd160.cpp -o hash/ripemd160.o
	gcc -m64 -march=native -mtune=native -mavx2 -msha -Wall -Wextra -Ofast -ftree-vectorize -flto -c hash/flo-shani.c -o hash/flo-shani.o
	       g++ -m64 -march=native -mtune=native -mavx2 -msha -Wall -Wextra -Wno-deprecated-copy -Ofast -ftree-vectorize -o bsgsd bsgsd.cpp base58.o hash/ripemd160.o hash/flo-shani.o bloom.o oldbloom.o xxhash.o util.o Int.o Point.o SECP256K1.o IntMod.o Random.o IntGroup.o sha3.o keccak.o -lm -lpthread -ljemalloc
