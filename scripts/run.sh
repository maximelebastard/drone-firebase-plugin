#! /bin/bash

[ -z "$FIREBASE_TOKEN" ] && echo "Please generate, set secret and expose the \"FIREBASE_TOKEN\" parameter. \n Run `firebase login:ci` locally to get a FIREBASE_TOKEN" && exit 1;
[ -z "$PLUGIN_PROJECT_ID" ] && echo "Please set the \"project_id\" parameter" && exit 1;
[ -z "$PLUGIN_MESSAGE" ] && echo "Please set the \"message\" parameter" && exit 1;
[ -z "$PLUGIN_DIR" ] && echo "Please set the \"dir\" parameter" && exit 1;


ONLY="";
if [ -n "${PLUGIN_ONLY}" ]
then
  ONLY="--only ${PLUGIN_ONLY}";
fi

set -o xtrace && \

if [ "$PLUGIN_DEBUG" = true ] ; then
  echo $(pwd) && ls -lah;
fi && \

cd $PLUGIN_DIR && \

firebase deploy -m "$PLUGIN_MESSAGE" --project "$PLUGIN_PROJECT_ID" $ONLY