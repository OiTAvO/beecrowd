"
    author: OiTAvO
    problem_name: construindo casas
    problem_number: 1541
    category: iniciante
    difficulty_level: 2
    link: https://judge.beecrowd.com/pt/problems/view/1541
"
(require '[clojure.string :refer [split]])

(defn- calc-value [a b c]
  (let [a (Integer/parseInt a)
        b (Integer/parseInt b)
        c (Integer/parseInt c)]
    (int (Math/sqrt (/ (* a b) (/ c 100))))))

(loop []
  (let [input (split (read-line) #" ")]
    (when-not (= ["0"] input)
      (println (apply calc-value input))
      (recur))))
