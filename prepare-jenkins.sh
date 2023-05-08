#!/bin/bash


function ValidatePlugin {
    maximumLoops=180
    stopLoops=1

    while true; do
        if [[ $maximumLoops -ne -$stopLoops ]]; then
            # check if Performance plugin is installed
            installedPlugins=$(curl -s -w "\n%{http_code}" "$JENKINS_URL/pluginManager/api/xml?depth=1")

            # echo "$installedPlugins"
            echo "[Info] Waiting for: $pluginName"

            if [[ $installedPlugins =~ $pluginName ]]; then
                echo "[Info] $pluginName detected"
                break
            else
                sleep 2
                maximumLoops=`expr $maximumLoops - 1`
            fi;
        else
            echo "[Info] There was a problem with the installation of the $pluginName. Run the configuration script again"
            break
        fi;
    done
}

function CreateJobForScriptsUpdating {
    fileLocation="/update-jenkins-jobs.xml"
    jobResponse=$(curl -s XPOST "$JENKINS_URL/createItem?name=Update%20Jenkins%20Jobs" --data @$fileLocation -H "Content-Type:application/xml")
    echo $jobResponse
}

echo "[Info] Waiting 4 minutes for plugins to be installed"
sleep 2

# add Pipeline plugin
pluginName="workflow-aggregator"
curl -X POST -d '<jenkins><install plugin="workflow-aggregator@596.v8c21c963d92d" /></jenkins>' --header 'Content-Type: text/xml' $JENKINS_URL/pluginManager/installNecessaryPlugins
ValidatePlugin

# add Workspace Cleanup plugin
pluginName="Workspace Cleanup"
curl -X POST -d '<jenkins><install plugin="ws-cleanup@0.45" /></jenkins>' --header 'Content-Type: text/xml' $JENKINS_URL/pluginManager/installNecessaryPlugins
ValidatePlugin

# add Performance plugin
pluginName="Performance Plugin"
curl -X POST -d '<jenkins><install plugin="performance@918.v5511b_a_d40338" /></jenkins>' --header 'Content-Type: text/xml' $JENKINS_URL/pluginManager/installNecessaryPlugins
ValidatePlugin

# wait for plugins to be properly configured
# sleep 2

# add Docker plugin
# pluginName="Docker"
# curl -X POST -d '<jenkins><install plugin="docker-plugin@1.3.0" /></jenkins>' --header 'Content-Type: text/xml' $JENKINS_URL/pluginManager/installNecessaryPlugins
# ValidatePlugin

# add Docker pipeline plugin
# pluginName="Docker Pipeline"
# curl -X POST -d '<jenkins><install plugin="docker-workflow@563.vd5d2e5c4007f" /></jenkins>' --header 'Content-Type: text/xml' $JENKINS_URL/pluginManager/installNecessaryPlugins
# ValidatePlugin

CreateJobForScriptsUpdating
