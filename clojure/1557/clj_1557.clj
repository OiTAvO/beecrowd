"
    author: OiTAvO
    problem_name: matriz quadrada III
    problem_number: 1557
    category: iniciant
    difficulty_level: 1
    link: https://judge.beecrowd.com/pt/problems/view/1557
"
(defn- gen-line [n]
  (vec (take n (iterate (partial * 2) 1))))

(defn- digits [n line]
  (let [val (* (line (dec n))
               (line (dec n)))]
    (count (map #(- (int %) 48) (str val)))))

(defn- calc-val [i j line]
  (* (line i) (line j)))

(defn- fmt-val [j n d]
  (str "%" d "d" (if (= j (dec n)) "\n" " ")))

(defn- prn-mtx [n]
  (let [line   (gen-line n)
        digits (digits n line)]
    (loop [i 0 j 0]
      (cond
        (= i n) (println)
        (= j n) (recur (inc i) 0)
        :else (do
                (let [val (calc-val i j line)
                      fmt (fmt-val j n digits)]
                  (printf fmt val))
                (recur i (inc j)))))))

(loop []
  (let [n (read)]
    (when-not (zero? n)
      (prn-mtx n)
      (recur))))
