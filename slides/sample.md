---
marp: true
theme: default
paginate: true
math: mathjax
---

# 微分積分学 第1回

## 極限と連続性

---

## 数列の極限

数列 $\{a_n\}$ が $\alpha$ に収束するとは：

$$
\forall \varepsilon > 0, \exists N \in \mathbb{N}, \forall n \geq N : |a_n - \alpha| < \varepsilon
$$

このとき $\displaystyle\lim_{n \to \infty} a_n = \alpha$ と書く。

---

## 例題

次の極限を求めよ。

$$
\lim_{n \to \infty} \frac{n^2 + 3n}{2n^2 - 1}
$$

### 解

$$
\frac{n^2 + 3n}{2n^2 - 1} = \frac{1 + \frac{3}{n}}{2 - \frac{1}{n^2}} \to \frac{1}{2} \quad (n \to \infty)
$$

---

## 関数の連続性

関数 $f$ が点 $a$ で連続であるとは：

$$
\lim_{x \to a} f(x) = f(a)
$$

すなわち、

$$
\forall \varepsilon > 0, \exists \delta > 0 : |x - a| < \delta \Rightarrow |f(x) - f(a)| < \varepsilon
$$

---

## 可換図式の例

TikZ で描いた可換図式を埋め込む：

![可換図式](./images/sample-diagram.svg)

$$f \circ g = k \circ h$$

---

## まとめ

- 数列の極限は $\varepsilon$-$N$ 論法で定義される
- 関数の連続性は $\varepsilon$-$\delta$ 論法で定義される
- 次回：微分の定義と基本的な計算
