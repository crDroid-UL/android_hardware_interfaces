/*
 * Copyright (C) 2021 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package android.hardware.radio;

/**
 * Redirecting Number Information Record as defined in C.S0005 section 3.7.5.11
 */
@VintfStability
@Backing(type="int")
enum CdmaRedirectingReason {
    UNKNOWN = 0,
    CALL_FORWARDING_BUSY = 1,
    CALL_FORWARDING_NO_REPLY = 2,
    CALLED_DTE_OUT_OF_ORDER = 9,
    CALL_FORWARDING_BY_THE_CALLED_DTE = 10,
    CALL_FORWARDING_UNCONDITIONAL = 15,
    RESERVED,
}
