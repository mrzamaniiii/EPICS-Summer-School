#!../../bin/linux-x86_64/streamIoc

#- SPDX-FileCopyrightText: 2003 Argonne National Laboratory
#-
#- SPDX-License-Identifier: EPICS


< envPaths


# =========================================================
# GO TO IOC TOP
# =========================================================

cd "${TOP}"


# =========================================================
# STREAMDEVICE PROTOCOL PATH
# =========================================================

epicsEnvSet "STREAM_PROTOCOL_PATH" "$(TOP)/protocol"


# =========================================================
# LOAD DATABASE DEFINITIONS
# =========================================================

dbLoadDatabase "dbd/streamIoc.dbd"

streamIoc_registerRecordDeviceDriver pdbbase


# =========================================================
# ASYN TCP CONNECTION
#
# Simulator:
# IP   = 127.0.0.1
# PORT = 5555
# =========================================================

drvAsynIPPortConfigure("SIM","127.0.0.1:5555",0,0,0)


# =========================================================
# LOAD RECORDS
# =========================================================

dbLoadRecords("db/device.db","P=mrzam:,PORT=SIM")


# =========================================================
# GO TO IOC BOOT DIRECTORY
# =========================================================

cd "${TOP}/iocBoot/${IOC}"


# =========================================================
# INITIALIZE IOC
# =========================================================

iocInit