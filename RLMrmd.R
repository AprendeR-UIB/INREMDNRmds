########



```{example}  
Se postula que la altura de un bebé ($Y$) es una función lineal de su edad en días ($X_1$), su altura al nacer en
cm ($X_2$), su peso en kg al nacer ($X_3$) y el aumento en tanto por ciento de su peso actual respecto de su peso al nacer ($X_4$)
```

El modelo que suponemos es
$$
  \mu_{Y|x_1,x_2,x_3,x_4}=\beta_0+\beta_1x_1+\beta_2x_2+\beta_3x_3+\beta_4x_4
$$
  
  
  En una muestra de $n=9$
  niños, los resultados fueron:
  
  \begin{center}
\begin{tabular}{|c|c|c|c|c|}\hline
$y$ & $x_1$ & $x_2$ & $x_3$ & $x_4$\\\hline
57.5&78&48.2&2.75&29.5\\ 52.8&69&45.5&2.15&26.3\\
61.3&77&46.3&4.41&32.2\\ 67&88&49&5.52&36.5\\ 53.5&67&43&3.21&27.2\\
62.7&80&48&4.32&27.7\\ 56.2&74&48&2.31&28.3\\ 68.5&94&53&4.3&30.3\\
69.2&102&58&3.71&28.7
\\\hline
\end{tabular}\end{center}

Queremos estimar $\beta_0,\beta_1,\beta_2,\beta_3,\beta_4$ a partir de esta muestra






Sean $b_0,\ldots,b_k$ estimaciones de $\beta_0,\ldots,\beta_k$
  
  
  Definen la **función de regresión lineal** para nuestra muestra:
  $$
  \widehat{y}=b_0+b_1 x_1+\cdots +b_kx_k}
$$
  
  El **error**, $i$-ésimo de este modelo es
$$
  e_i}=y_i-(b_0+b_1 x_{i1}+\cdots +b_kx_{ik})
  $$
    
    Los **estimadores por mínimos cuadrados** de $\beta_0,\beta_1,\ldots, \beta_k$ son los
  valores $b_0,b_1,\ldots, b_k$ que minimizan
  $$
    \sum\limits_{i=1}^n e^2_i=
    \sum\limits_{i=1}^n (y_i-b_0-b_1 x_{i 1}-\cdots -b_{k} x_{ik})^2.
  $$
    
    
    
    
    
    
    
    
    
    ```{r}
  X=matrix(c(78,48.2,2.75,29.5,69,45.5,
             2.15,26.3,77,46.3,4.41,32.2,88,49,5.52,
             36.5,67,43,3.21,27.2,80,48,4.32,27.7,74,
             48,2.31,28.3,94,53,4.3,30.3,102,58,3.71,
             28.7), nrow=9, byrow=TRUE, 
           dimnames=list(NULL,c("x1","x2","x3","x4")))
  y=c(57.5,52.8,61.3,67,53.5,62.7,56.2,68.5,
      69.2)
  cbind(y,X)
  y  x1   x2   x3   x4
  [1,] 57.5  78 48.2 2.75 29.5
  [2,] 52.8  69 45.5 2.15 26.3
  [3,] 61.3  77 46.3 4.41 32.2
  [4,] 67.0  88 49.0 5.52 36.5
  [5,] 53.5  67 43.0 3.21 27.2
  [6,] 62.7  80 48.0 4.32 27.7
  [7,] 56.2  74 48.0 2.31 28.3
  [8,] 68.5  94 53.0 4.30 30.3
  [9,] 69.2 102 58.0 3.71 28.7
  
  round(lm(y~X)$coefficients,4)
  (Intercept)    Xx1    Xx2     Xx3      Xx4 
  7.1475 0.1001 0.7264  3.0758  -0.0300 
  ```
  
  La función lineal estimada es
  $$
    \widehat{y}=7.1475+ 0.1001x_1+ 0.7264x_2+  3.0758x_3  -0.03x_4
  $$
    
    
    
    Propiedades
  
  
  *  La recta de regresión pasa por el vector de medias muestrales
  $(\overline{x}_1,\overline{x}_2,\ldots,\overline{x}_k,\overline{y})$:
    $$
    \overline{y}=b_0+b_1 \overline{x}_1+\cdots+b_1 \overline{x}_k
  $$
    
    *  La media de los valores estimados es igual a la media de los
  observados:
    $$
    \overline{\,\widehat{y}\,}=\overline{y}
  $$
    
    
    
    
    
    
    
    
    
    El **coeficiente de determinación** de una regresión lineal múltiple es
  $$
    R^2=\frac{s^2_{\widehat{y}}}{s^2_y}
  $$
    Representa la fracción de la varianza de $y$ que es explicada
  por la varianza de $\widehat{y}$
    
    
    
    $R^2$ siempre crece con el número $k$ de variables independientes, incluso si las variables que añadimos no sirven para nada
  
  
  Para tenerlo en cuenta, en lugar de usar
  $R^2$,  se usa el **coeficiente de determinación ajustado**
    $$
    R^2_{adj}=1-(1-R^2)\frac{n-1}{n-k-1}
  $$
    
    Si queremos comparar dos modelos lineales para una misma variable dependiente y diferentes conjuntos de variables independientes con diferentes números de variables, no hay que comparar los $R^2$, sino los $R^2_{adj}$: a mayor valor de $R^2_{adj}$, mejor es el modelo
  
  
  
  
  
  
  
  
  ¿Sería mejor el modelo si no tuviéramos en cuenta $X_4$  (el aumento de peso en \%)?
    
    ```{r}
  X1X2X3=X[,1:3]
  summary(lm(y~X1X2X3))$adj.r.squared
  [1] 0.9851091
  ```
  Tomando las variables independientes $X_1,X_2,X_3,X_4$, obtenemos $R^2_{adj}=0.9815$, y tomando solo $X_1,X_2,X_3$,
  obtenemos $R^2_{adj}=0.9851$
    
    El modelo es mejor si no tenemos en cuenta $X_4$
    
    
    
    
    \subsection{Int. de confianza}
  
  Más propiedades}

Si todas las vv.aa.\ error}, o residuo},
$$
  E_{\underline{x}_i}}=(Y|\underline{x}_i)-(\beta_0+\beta_1 x_{i1}+\cdots+\beta_k x_{ik})
  $$
    (donde $\underline{x}_i}=(x_{i1},\ldots,x_{ik})$)
  son normales de media 0 y la misma varianza, e incorreladas dos a dos, de nuevo:
    
    
    *  $E(b_i)=\beta_i$, para todo $i=0,\ldots,k$
    
    *  Entre todos los estimadores insesgados de los $\beta_i$, los $b_i$ son los que tienen menor error estándar
  
  *  (Unos estadísticos relacionados con) los $b_i$ tienen distribuciones conocidas, que permiten calcular intervalos de confianza para cada $\beta_i$ y para $\mu_{Y|\underline{x}_0}$ usando la t de Student
  
  
  
  
  
  
  
  
  
  Intervalos de confianza}
Los IC 95\% para los $\beta_i$ se obtienen con la función \tt confint(lm(y\~{}x1+...+xk,data=...))}

```{r}
DatosYX=data.frame(y,X)
confint(lm(y~x1+x2+x3+x4,data=DatosYX))
2.5 %     97.5 %
  (Intercept) -38.5516748 52.8467396
x1           -0.8430889  1.0432778
x2           -1.4555952  2.9084299
x3            0.1350854  6.0165886
x4           -0.4922156  0.4321313
```
%
%Con el IC 95\% de $\beta_i$ también se puede contrastar si $\beta_i=0$ o no
%
%En este caso, el único IC 95\% que no contiene el 0 es el de $\beta_3$
  
  
  
  
  
  Intervalos de confianza}
El IC 95\% para $\mu_{Y|\underline{x}_0}$ se obtiene con la construcción siguiente

```{r}
Reg.Lin=lm(y~x1+x2+x3+x4,data=DatosYX)
Datos.Nuevos=data.frame(x1=69,x2=45.5,x3=2.15,x4=26.3)
predict.lm(Reg.Lin, Datos.Nuevos, intervalo="confidence")
fit lwr upr
1 52.92898 51.49164 54.36633
```






\subsection{Anova}


¿Tiene sentido una regresión lineal?}
Cómo en el caso simple, nos interesa el contraste
$$
  \left\{\begin{array}{l} H_0: \beta_1=\beta_2=\cdots=\beta_k=0 \\
  H_1: \mbox{hay algún }\beta_i \neq 0 \end{array}
  \right.
  $$
    Si la hipótesis nula es verdadera, $\mu_{Y|x_1,\ldots,x_k}=\beta_0$ no depende de $X_1,\ldots,X_k$, no tiene sentido la regresión lineal
    
    
    
    
    ¿Tiene sentido una regresión lineal?}

Esto se puede mirar con $k$ contrastes
$$
  \left\{\begin{array}{l} H_0: \beta_i=0 \\
  H_1: \beta_i
  \neq 0 \end{array}
  \right.
  $$
    usando un estadístico adecuado que sigue una ley t de Student (bajo las suposiciones sobre las vv.aa. $E_{\underline{x}_i}$).
  Sus p-valores se obtienen en la columna \texttt{Pr(>|t|)} de la tabla \texttt{Coefficients}
  del resultado del \texttt{summay(lm(...))}.
  
  También se pueden usar los IC 95\% para los $\beta_i$
    
    
    
    
    
    
    Ejemplo}

```{r}[style=petit]
summary(lm(y~x1+x2+x3+x4,data=DatosYX))
...
Coefficients:
  Estimate Std. Error t value Pr(>|t|)  
(Intercept)  7.14753   16.45961   0.434   0.6865  
x1           0.10009    0.33971   0.295   0.7829  
x2           0.72642    0.78590   0.924   0.4076  
x3           3.07584    1.05918   2.904   0.0439 *
  x4          -0.03004    0.16646  -0.180   0.8656  
---
  Signif. codes:  0 `***' 0.001 `**' 0.01 `*' 0.05 `.' 0.1 ` ' 1
...
```

Pero son $k$ contrastes, y no independientes, por lo tanto garantizar el nivel de significación global es complicado






ANOVA en la regresión lineal}

Otra posibilidad es emplear un ANOVA:


Si $$\beta_1=\beta_2=\cdots=\beta_k=0,$$ entonces $$\mu_{Y|\underline{x}_1}=\cdots=\mu_{Y|\underline{x}_k}(=\beta_0)$$}
Por lo tanto, si en el contraste
$$
\left\{\begin{array}{l}
H_0:\mu_{Y|\underline{x}_1}=\cdots=\mu_{Y|\underline{x}_k}\\
H_1:\mbox{no es verdad que\ldots}
\end{array}
\right.
$$
rechazamos la hipótesis nula, podemos rechazar que $\beta_1=\beta_2=\cdots=\beta_k=0$
y el modelo tendrá sentido






ANOVA en la regresión lineal}
El p-valor de este ANOVA se da en la última fila del \texttt{summary(lm(...))}

```{r}
summary(lm(y~X))
...
Residual standard error: 0.861 on 4 degrees of freedom
Multiple R-squared:  0.9908,	
   Adjusted R-squared:  0.9815 
F-statistic: 107.3 on 4 and 4 DF,  
   p-value: 0.0002541
```

--->
