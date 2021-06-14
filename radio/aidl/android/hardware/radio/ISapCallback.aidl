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

import android.hardware.radio.SapConnectRsp;
import android.hardware.radio.SapDisconnectType;
import android.hardware.radio.SapResultCode;
import android.hardware.radio.SapStatus;

@VintfStability
interface ISapCallback {
    /**
     * TRANSFER_APDU_RESP from SAP 1.1 spec 5.1.7
     *
     * @param token Id to match req-resp. Value must match the one in req.
     * @param resultCode ResultCode to indicate if command was processed correctly
     *        Possible values:
     *        SapResultCode:SUCCESS,
     *        SapResultCode:GENERIC_FAILURE,
     *        SapResultCode:CARD_NOT_ACCESSSIBLE,
     *        SapResultCode:CARD_ALREADY_POWERED_OFF,
     *        SapResultCode:CARD_REMOVED
     * @param apduRsp APDU Response. Valid only if command was processed correctly and no error
     *        occurred.
     */
    oneway void apduResponse(in int token, in SapResultCode resultCode, in byte[] apduRsp);

    /**
     * CONNECT_RESP from SAP 1.1 spec 5.1.2
     *
     * @param token Id to match req-resp. Value must match the one in req.
     * @param sapConnectRsp Connection Status
     * @param maxMsgSize MaxMsgSize supported by server if request cannot be fulfilled.
     *        Valid only if connectResponse is SapConnectResponse:MSG_SIZE_TOO_LARGE.
     */
    oneway void connectResponse(in int token, in SapConnectRsp sapConnectRsp, in int maxMsgSize);

    /**
     * DISCONNECT_IND from SAP 1.1 spec 5.1.5
     *
     * @param token Id to match req-resp. Value must match the one in req.
     * @param disconnectType Disconnect Type to indicate if shutdown is graceful or immediate
     */
    oneway void disconnectIndication(in int token, in SapDisconnectType disconnectType);

    /**
     * DISCONNECT_RESP from SAP 1.1 spec 5.1.4
     *
     * @param token Id to match req-resp. Value must match the one in req.
     */
    oneway void disconnectResponse(in int token);

    /**
     * ERROR_RESP from SAP 1.1 spec 5.1.19
     *
     * @param token Id to match req-resp. Value must match the one in req.
     */
    oneway void errorResponse(in int token);

    /**
     * POWER_SIM_OFF_RESP and POWER_SIM_ON_RESP from SAP 1.1 spec 5.1.11 + 5.1.13
     *
     * @param token Id to match req-resp. Value must match the one in req.
     * @param resultCode ResultCode to indicate if command was processed correctly
     *        Possible values:
     *        SapResultCode:SUCCESS,
     *        SapResultCode:GENERIC_FAILURE,
     *        SapResultCode:CARD_NOT_ACCESSSIBLE, (possible only for power on req)
     *        SapResultCode:CARD_ALREADY_POWERED_OFF, (possible only for power off req)
     *        SapResultCode:CARD_REMOVED,
     *        SapResultCode:CARD_ALREADY_POWERED_ON (possible only for power on req)
     */
    oneway void powerResponse(in int token, in SapResultCode resultCode);

    /**
     * RESET_SIM_RESP from SAP 1.1 spec 5.1.15
     *
     * @param token Id to match req-resp. Value must match the one in req.
     * @param resultCode ResultCode to indicate if command was processed correctly
     *        Possible values:
     *        SapResultCode:SUCCESS,
     *        SapResultCode:GENERIC_FAILURE,
     *        SapResultCode:CARD_NOT_ACCESSSIBLE,
     *        SapResultCode:CARD_ALREADY_POWERED_OFF,
     *        SapResultCode:CARD_REMOVED
     */
    oneway void resetSimResponse(in int token, in SapResultCode resultCode);

    /**
     * STATUS_IND from SAP 1.1 spec 5.1.16
     *
     * @param token Id to match req-resp. Value must match the one in req.
     * @param status Parameter to indicate reason for the status change.
     */
    oneway void statusIndication(in int token, in SapStatus status);

    /**
     * TRANSFER_ATR_RESP from SAP 1.1 spec 5.1.9
     *
     * @param token Id to match req-resp. Value must match the one in req.
     * @param resultCode ResultCode to indicate if command was processed correctly
     *        Possible values:
     *        SapResultCode:SUCCESS,
     *        SapResultCode:GENERIC_FAILURE,
     *        SapResultCode:CARD_ALREADY_POWERED_OFF,
     *        SapResultCode:CARD_REMOVED,
     *        SapResultCode:DATA_NOT_AVAILABLE
     * @param atr Answer to Reset from the subscription module. Included only if no error occurred,
     *        otherwise empty.
     */
    oneway void transferAtrResponse(in int token, in SapResultCode resultCode, in byte[] atr);

    /**
     * TRANSFER_CARD_READER_STATUS_REQ from SAP 1.1 spec 5.1.18
     *
     * @param token Id to match req-resp. Value must match the one in req.
     * @param resultCode ResultCode to indicate if command was processed correctly
     *        Possible values:
     *        SapResultCode:SUCCESS,
     *        SapResultCode:GENERIC_FAILURE
     *        SapResultCode:DATA_NOT_AVAILABLE
     * @param cardReaderStatus Card Reader Status coded as described in 3GPP TS 11.14 Section 12.33
     *        and TS 31.111 Section 8.33
     */
    oneway void transferCardReaderStatusResponse(
            in int token, in SapResultCode resultCode, in int cardReaderStatus);

    /**
     * SET_TRANSPORT_PROTOCOL_RESP from SAP 1.1 spec 5.1.21
     *
     * @param token Id to match req-resp. Value must match the one in req.
     * @param resultCode ResultCode to indicate if command was processed correctly
     *        Possible values:
     *        SapResultCode:SUCCESS
     *        SapResultCode:NOT_SUPPORTED
     */
    oneway void transferProtocolResponse(in int token, in SapResultCode resultCode);
}
