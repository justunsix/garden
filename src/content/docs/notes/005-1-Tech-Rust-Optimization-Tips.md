---
filetags: ":rust:tech:language:index:epubnote:"
id: 556033f7-4401-412d-abbb-1fbc854c49fd
title: Rust Optimization Tips
---

Assess when and where there are performance optimizations \[fn:1\].

## General Optimizations

### Borrow instead of clone, avoid Unnecessary Memory Allocations

Example: pass using references if value is not needed yet

### Ask the map once with entry, Avoid repeating work

Example: if possible, combine multiple look ups on variable

### Parallelism counting with Rayon, Use all cores on your machine

Example: use `rayon` crate to convert sequential computation into
parallel computation with one call - \`par<sub>iter</sub>\` instead of
\`iter\`

### Example optimized

Parses a log and extracts user names in first column of comma separated
line and shows top ten users.

``` rust

fn top_users(log &str) -> Vec<(String, u64)> {
    let counts: HashMap<&str, u64> = log
       // Parallel run with rayon
       .par_lines()
       .fold(HashMap::new, |mut ace, line| {
           let user = line.split(',').nth(1).unwrap();
           // instead of looking up user multiple times, use entry()
           *acc.entry(user).or_insert(0) += 1;
           acc
       })
       .reduce(HashMap::new, |mut a, b| {
         for (k, v): in b { *a.entry(k).or_insert(0) += v }
         a
       })
    let mut ranked: Vec<(&str, u64)> = counts.into_iter().collect();
    ranked.sort_by(|a, b| b.1.cmp(&a.1));
    ranked.truncate(10);
    ranked.into_iter()
      // Use borrowed value and call to_string() when value is needed
      .map(|(user, n)| (user.to_string(), n))
      .collect()
}

```

## swap<sub>remove</sub> when order does not matter - Avoid expensive operations with vector

Example: use `swap_remove` instead of `remove` for a remove item from a
vector if order does not matter. Results in a ~7,000x faster execution.

``` rust

fn end_session(sessions: &mut Vec<Session>, idx: usize) {
    // swap_remove() instead of remove()
    sessions.swap_remove(idx);
}

```

## References

- \[fn:1\] [Let's Get Rusty-BLAZINGLY FAST Rust Optimizations -
  YouTube](https://www.youtube.com/watch?v=r_VoEa8HlPk)
