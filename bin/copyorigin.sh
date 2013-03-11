#!/bin/sh

# Copies original source tree to working directory.

ORIGINDIR=/home/igarasr/src/CAENHV/EPICS

cp -i ${ORIGINDIR}/Makefile .

DESTDIR=configure
if [ ! -e ${DESTDIR} ] ; then
	echo "\"${DESTDIR}\" doesn't exist. Creating." ;
	cp -i -r ${ORIGINDIR}/configure .
fi

DESTDIR=HVCAENx527App
if [ ! -e ${DESTDIR} ] ; then
	echo "\"${DESTDIR}\" doesn't exist. Creating." ;
	mkdir ${DESTDIR};
	mkdir ${DESTDIR}/src ${DESTDIR}/Db;
	OSUBDIR=${ORIGINDIR}/${DESTDIR}
	cp -i ${OSUBDIR}/Makefile ${DESTDIR}
	cp -i ${OSUBDIR}/src/HVCAENx527* ${OSUBDIR}/src/Makefile ${DESTDIR}/src
	cp -i ${OSUBDIR}/Db/HVCAENx527* ${OSUBDIR}/Db/Makefile ${DESTDIR}/Db
	cp -i configure/Makefile_src.update ${DESTDIR}/src/Makefile.update
	cp -i configure/Makefile_db.update ${DESTDIR}/Db/Makefile.update
fi

DESTDIR=iocBoot
if [ ! -e ${DESTDIR} ] ; then
	echo "\"${DESTDIR}\" doesn't exist. Creating." ;
	mkdir ${DESTDIR};
	mkdir ${DESTDIR}/iocHVCAENx527
	OSUBDIR=${ORIGINDIR}/${DESTDIR}
	cp -i ${OSUBDIR}/Makefile ${DESTDIR}
	OSUBDIR=${ORIGINDIR}/${DESTDIR}/iocHVCAENx527
	cp -i ${OSUBDIR}/Makefile ${OSUBDIR}/envPaths ${OSUBDIR}/st.cmd ${DESTDIR}/iocHVCAENx527
fi

DESTDIR=opi
if [ ! -e ${DESTDIR} ] ; then
	echo "\"${DESTDIR}\" doesn't exist. Creating." ;
	mkdir ${DESTDIR};
	OSUBDIR=${ORIGINDIR}/${DESTDIR}
	cp -i ${OSUBDIR}/HVCAENx527*.edl ${OSUBDIR}/runCAENHV ${DESTDIR}
fi
