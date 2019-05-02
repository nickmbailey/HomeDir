{:user  {:dependencies [[slamhound "1.5.5"]
                        [jonase/eastwood "0.3.5" :exclusions [org.clojure/clojure]]]
         :plugins  [[com.jakemccrary/lein-test-refresh "0.21.1"]
                    [venantius/yagni "0.1.7"]
                    ;[cider/cider-nrepl "0.20.0"]
;                    [venantius/ultra "0.6.0"]
                    [lein-pprint "1.1.1"]]
         :test-refresh {:notify-command ["terminal-notifier" "-title" "Tests" "-message"]}}}

