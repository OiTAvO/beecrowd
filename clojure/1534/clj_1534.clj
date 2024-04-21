"
    author: OiTAvO
    problem_name: matriz 123
    problem_number: 1534
    category: iniciante
    difficulty_level: 1
    link: https://judge.beecrowd.com/pt/problems/view/1534
"
(defn- calc-val [i j n]
  (cond
    (= (- (dec n) j) i)         2
    (= i j)                     1
    :else                       3))

(defn- fmt-val [j n]
  (if (= j (dec n)) "%d\n" "%d"))

(defn- prn-mtx [n]
  (loop [i 0 j 0]
    (cond
      (= i n) nil
      (= j n) (recur (inc i) 0)
      :else (do
              (let [val (calc-val i j n)
                    fmt (fmt-val j n)]
                (printf fmt val))
              (recur i (inc j))))))

(loop []
  (let [n (read *in* false :end)]
    (when-not (= :end n)
      (prn-mtx n)
      (recur))))
