"
    author: OiTAvO
    problem_name: matriz quadrada II
    problem_number: 1478
    category: iniciante
    difficulty_level: 1
    link: https://judge.beecrowd.com/pt/problems/view/1478
"
(defn- gen-line [n]
  (vec (range 1 (inc n))))

(defn- calc-val [i j line]
  (line (Math/abs (- i j))))

(defn- fmt-val [j n]
  (if (= j (dec n)) "%3d\n" "%3d "))

(defn- prn-mtx [n]
  (loop [i 0 j 0 line (gen-line n)]
    (cond
      (= i n) (println)
      (= j n) (recur (inc i) 0 line)
      :else (do
              (let [val (calc-val i j line)
                    fmt (fmt-val j n)]
                (printf fmt val))
              (recur i (inc j) line)))))

(loop []
  (let [n (read)]
    (when-not (zero? n)
      (prn-mtx n)
      (recur))))
