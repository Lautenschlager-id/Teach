>### f ( x, y )
>| Parameter | Type | Required | Description |
>| :-: | :-: | :-: | - |
>| a | `int` | ✔ | A number. |
>| b | `table` | ✕ | A number. <sub>(default = 0)</sub> |
>
>**@`b` parameter's structure**:
>
>| Index | Type | Required | Description |
>| :-: | :-: | :-: | - |
>| f | `int` | ✔ | An enum from `enumerations.forum` |
>| s | `int` | ✕ | An enum from `enumerations.section` |
>
>This function performs the sum, sub, mul, and div between the parameters.
>
>**Returns**:
>
>| Type | Description |
>| :-: | - |
>| `table`, `nil` | The arithmetic table |
>| `nil`, `string` | Error message |
>
>**Table structure**
>```Lua
>{
>	sum = 0.0, -- The sum
>	sub = 0.0, -- The subtraction
>	mul = 0.0, -- The multiplication
>	div = 0.0 -- The division
>}
>```

### role <sub>\<int\></sub>
###### Staff role ids.
| index | value |
| - | :-: |
| administrator | 01 |
| moderator | 10 |
| sentinel | 15 |
| mapcrew  | 20 |

### location <sub>\<table\></sub>
###### Locations.
**Structure:**
```
enums.community
	└ enums.forum
		└ enums.section
```
