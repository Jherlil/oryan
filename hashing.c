#include "hash/flo-shani.h"
#include "CryptoUtil/CryptoUtil.h"
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "hashing.h"
#include "sha3/sha3.h"

int sha256(const unsigned char *data, size_t length, unsigned char *digest) {
    sha256_update_shani(data, length, digest);
    return 0;
}

int sha256_4(size_t length, const unsigned char *data0, const unsigned char *data1,
             const unsigned char *data2, const unsigned char *data3,
             unsigned char *digest0, unsigned char *digest1,
             unsigned char *digest2, unsigned char *digest3) {
    unsigned char *msgs[4] = {(unsigned char*)data0, (unsigned char*)data1,
                              (unsigned char*)data2, (unsigned char*)data3};
    unsigned char *digests[4] = {digest0, digest1, digest2, digest3};
    sha256_x4_update_shani_4x(msgs, length, digests);
    return 0;
}

// Function for hashing
int keccak(const unsigned char *data, size_t length, unsigned char *digest) {
	SHA3_256_CTX ctx;
	SHA3_256_Init(&ctx);
	SHA3_256_Update(&ctx,data,length);
	KECCAK_256_Final(digest,&ctx);
	return 0; // Success
}



int rmd160(const unsigned char *data, size_t length, unsigned char *digest) {
    if (length > 55) {
        // Implementation only supports up to one block
        return 1;
    }

    unsigned int msg[16] = {0};
    unsigned int temp[5];

    for (size_t i = 0; i < length; ++i) {
        msg[i / 4] |= (unsigned int)data[i] << ((i % 4) * 8);
    }

    msg[length / 4] |= 0x80U << ((length % 4) * 8);
    msg[14] = (unsigned int)(length * 8);

    crypto::ripemd160(msg, temp);

    for (int i = 0; i < 5; ++i) {
        unsigned int w = temp[i];
        digest[i * 4]     = (unsigned char)(w >> 24);
        digest[i * 4 + 1] = (unsigned char)(w >> 16);
        digest[i * 4 + 2] = (unsigned char)(w >> 8);
        digest[i * 4 + 3] = (unsigned char)w;
    }

    return 0;
}

int rmd160_4(size_t length, const unsigned char *data0, const unsigned char *data1,
                const unsigned char *data2, const unsigned char *data3,
                unsigned char *digest0, unsigned char *digest1,
                unsigned char *digest2, unsigned char *digest3) {
    if (rmd160(data0, length, digest0)) return 1;
    if (rmd160(data1, length, digest1)) return 1;
    if (rmd160(data2, length, digest2)) return 1;
    if (rmd160(data3, length, digest3)) return 1;
    return 0;
}
bool sha256_file(const char* file_name, uint8_t* digest) {
    FILE* file = fopen(file_name, "rb");
    if (file == NULL) {
        printf("Failed to open file: %s\n", file_name);
        return false;
    }

    fseek(file, 0, SEEK_END);
    long size = ftell(file);
    if (size < 0) {
        fclose(file);
        return false;
    }
    rewind(file);

    uint8_t *buffer = (uint8_t*)malloc(size);
    if (!buffer) {
        fclose(file);
        return false;
    }

    if (fread(buffer, 1, size, file) != (size_t)size) {
        free(buffer);
        fclose(file);
        return false;
    }

    sha256_update_shani(buffer, (size_t)size, digest);

    free(buffer);
    fclose(file);
    return true;
}

void rseed(unsigned long seed) {
    srand((unsigned int)seed);
}
