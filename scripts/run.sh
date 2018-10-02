#! /bin/bash

[ -z "$PLUGIN_PROJECT_ID" ] && echo "Please set the \"project_id\" parameter" && exit 1;
[ -z "$PLUGIN_MESSAGE" ] && echo "Please set the \"message\" parameter" && exit 1;
[ -z "$PLUGIN_DIR" ] && echo "Please set the \"dir\" parameter" && exit 1;
[ -z "$PLUGIN_FIREBASE_JSON" ] && echo "Please set the \"firebase_json\" parameter" && exit 1;
[ -z "$PLUGIN_FIREBASE_RC" ] && echo "Please set the \"firebase_rc\" parameter" && exit 1;

set -o xtrace && \

if [ "$PLUGIN_DEBUG" = true ] ; then
  echo $(pwd) && ls -lah;
fi && \


cp $PLUGIN_FIREBASE_JSON "$PLUGIN_DIR/firebase.json" && \
cp $PLUGIN_FIREBASE_RC "$PLUGIN_DIR/.firebaserc" && \

cd $PLUGIN_DIR && \

firebase use $PLUGIN_PROJECT_ID && \

firebase deploy --token "$FIREBASE_TOKEN" -m "$PLUGIN_MESSAGE"