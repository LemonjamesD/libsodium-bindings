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
