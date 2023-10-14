{-# LANGUAGE CApiFFI #-}

-- |
-- Module: LibSodium.Bindings.Conversions
-- Description: Sodium Conversions
-- Copyright: (C) Lemon
-- License: MIT
-- Maintainer: lemonjameslem@protonmail.com
-- Stability: Stable
-- Portability: GHC only
module LibSodium.Bindings.Conversions
  ( -- * Functions
  ) where

import Foreign
import Foreign.C
import Foreign.C.ConstPtr

-- | Converts a binary number to base64
--
-- /See:/ [base64-encoding-decoding](https://libsodium.gitbook.io/doc/helpers#base64-encoding-decoding)
foreign import capi "sodium.h sodium_bin2base64"
  sodiumBin2Base64
    :: Ptr CChar
    -- ^ Resulting conversion to base64 is stored here including C null terminator
    -- ^ NOTE: This is `char *const`
    -> CSize
    -- ^ Maximum number of bytes allowed to be stored in base64 number when converting
    -- ^ WARNING: Must be 2 * binLen + 1 in size
    -- ^ NOTE: This is `const size_t` in sodium
    -> ConstPtr CUChar
    -- ^ Binary number to convert to base64
    -- ^ NOTE: This is `const unsigned char *const` in sodium
    -> CSize
    -- ^ Amount of bytes to convert to base64
    -- ^ NOTE:
    -- ^ NOTE: This is `const size_t` in sodium
    -> CInt
    -- ^ The variant of base64 to use
    -- ^ NOTE: This is `const int` in sodium
    -> Ptr CChar
    -- ^ The result of converting bin to base64

-- | Converts a base64 number to binary
--
-- /See:/ [base64-encoding-decoding](https://libsodium.gitbook.io/doc/helpers#base64-encoding-decoding)
foreign import capi "sodium.h sodium_base642bin"
  sodiumBase642Bin
    :: Ptr CUChar
    -- ^ Place to store the resulting binary number
    -- ^ NOTE: This is `unsigned char *const` in sodium
    -> CSize
    -- ^ Amount of bytes allowed to write to the storage place of the binary number
    -- ^ NOTE: This is `const size_t` in sodium
    -> ConstPtr CChar
    -- ^ Base64 number to decode
    -- ^ NOTE: This is `const char *const` in sodium
    -> CSize
    -- ^ Length of bytes to decode into a binary number
    -- ^ NOTE: This is `const size_t` in sodium
    -> ConstPtr CChar
    -- ^ TODO
    -- ^ NOTE: This is `const char *const` in sodium
    -> Ptr CSize
    -- ^ TODO
    -- ^ NOTE: This is `size_t *const` in sodium
    -> Ptr ConstPtr CChar
    -- ^ TODO
    -- ^ NOTE: This is `const char **const` in sodium
    -> CInt
    -- ^ Variant type of the base64 number
    -- ^ NOTE: This is `const int` in sodium
    -> CInt
    -- ^ Error code, 0 on success,
    -- ^ -1 if more than bin_maxlen bytes would be required,
    -- ^ or it the string couldn't be fully parsed
