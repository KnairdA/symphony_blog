# Rewrite rules to run Symphony CMS on Lighttpd

url.rewrite-once += ( "^/favicon.ico$" => "$0",
                      "^/robots.txt$" => "$0",
                      "^/symphony/(assets|content|lib|template)/.*$" => "$0",
                      "^/workspace/([^?]*)" => "$0",
                      "^/symphony(\/(.*\/?))?(.*)\?(.*)$" => "/index.php?symphony-page=$1&mode=administration&$4&$5",
                      "^/symphony(\/(.*\/?))?$" => "/index.php?symphony-page=$1&mode=administration",
                      "^/([^?]*/?)(\?(.*))?$" => "/index.php?symphony-page=$1&$3" )
