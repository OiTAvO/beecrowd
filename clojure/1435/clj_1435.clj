"
    author: OiTAvO
    problem_name: matriz quadrada 1
    problem_number: 1435
    category: iniciante
    difficulty_level: 5
    link: https://judge.beecrowd.com/pt/problems/view/1435
"
(defn- mean [n]
  (+ (quot n 2) (rem n 2)))

(defn- gen-line [n]
  (let [mean (mean n)
        mid-line (range 1 (inc mean))
        coll-fn (if (even? n) identity next)]
    (reduce conj
            (vec mid-line)
            (coll-fn (reverse mid-line)))))

(defn- calc-val [i j line]
  (min (line i) (line j)))

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

(defn- read-int []
  (Integer/parseInt (read-line)))

(loop []
  (let [n (read-int)]
    (when-not (zero? n)
      (prn-mtx n)
      (recur))))
