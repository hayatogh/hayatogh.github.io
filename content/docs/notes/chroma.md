---
title: "Chroma"
weight: 1
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
# bookHref: ''
# bookIcon: ''
---

Chroma highlight example
```c
// CommentSingle
/*
 * CommentMultiline
 */

#include <stdio.h>
#define MAX_BUFFER 1024

struct Point {
    int x;
    int y;
};

static const int base_value = 10;
static bool flag = true;

int calculate_area(int width, int height) {
    return width * height;
}

int main() {
    float radius = 5.5f;

    char initial = 'C';

    char *message = "Total:\t%d\n";

    if (radius > 0) {
        printf(message, base_value);
    }

cleanup:
    return 0;
}
```

```rust
// CommentSingle
/*
 * CommentMultiline
 */
/// LiteralStringDoc

#[derive(Debug, Clone)]
pub struct Point {
    pub x: i32,
    pub y: i32,
}

trait Area {
    fn calculate(&self) -> f64;
}

impl Area for Point {
    fn calculate(&self) -> f64 {
        ((self.x * self.x + self.y * self.y) as f64).sqrt()
    }
}

fn main() {
    let p = Point { x: 10, y: 20 };

    let is_active = true;

    println!("Point: x={:?}, y={:?}\n", p.x, p.y);

    let path = r"C:\Users\Project";

    match p.x {
        10 => println!("Value is ten"),
        _ => println!("Other"),
    }

    for i in 0..5 {
        continue;
    }
}
```

```python
#!/usr/bin/env python

# CommentSingle
"""
LiteralStringDouble
"""

import sys

class TargetClass:
    is_active = True

    def __init__(self, value: int):
        self.value = value

    def check_logic(self):
        if self.value is not None and True:
            print("Action")

        if "item" in ["item", "other"]:
            pass

def process_data():
    hex_num = 0x1A
    float_num = 0.5
    escaped = "First line\nSecond line"

    calculation = 10 + 20 * 30 / 2

    items = [1, 2, 3]
```

```sql
-- CommentSingle
SELECT * FROM users
WHERE id = 1
  AND status IS NOT NULL;
```

```diff
--- GenericDeleted
+++ GenericInserted
@@ -1,3 +1,3 @@ GenericSubheading
- GenericDeleted
+ GenericInserted
! GenericStrong
```

[alecthomas/chroma: A general purpose syntax highlighter in pure Go](https://github.com/alecthomas/chroma)

[https://github.com/alecthomas/chroma/blob/master/types.go](https://github.com/alecthomas/chroma/blob/master/types.go)
for Chroma Type name and CSS classes.
