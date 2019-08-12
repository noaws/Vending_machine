# Vending machine

## 状态编码方式

| S1   | S0   | State | Note                                                         |
| ---- | ---- | ----- | ------------------------------------------------------------ |
| 0    | 1    | PAID  | 0.5¥ was previously inserted and a one   Yuan has just been inserted, or 1¥ was previously inserted and a five Jiao   has just been inserted, or just started. |
| 0    | 0    | FIVE  | No money was previously inserted. A five   Jiao has just been inserted. |
| 1    | 0    | ONE   | No money was previously inserted. A one   Yuan has just been inserted. |
| 1    | 1    | ONERJ | 1¥ was previously inserted and a one Yuan   has just been inserted, which would be rejected. |

## 状态表

| State | S1S0 | S1+S0+ |      | A    | P    |
| ----- | ---- | ------ | ---- | ---- | ---- |
|       |      | T=0    | T=1  |      |      |
| PAID  | 01   | 00     | 10   | 1    | 1    |
| FIVE  | 00   | 10     | 01   | 1    | 0    |
| ONE   | 10   | 11     | 11   | 1    | 0    |
| ONERJ | 11   | 01     | 11   | 0    | 0    |