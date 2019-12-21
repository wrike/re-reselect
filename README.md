# Re-reselect for Dart

A Selector library for Dart, based on the original [Re-reselect JavaScript library](https://github.com/toomuchdesign/re-reselect).

## Motivation

`re-reselect` is a lightweight wrapper around **[Reselect](https://github.com/brianegan/reselect_dart)** meant to enhance selectors with **deeper memoization** and **cache management**.

**Switching between different arguments** using standard `reselect` selectors causes **cache invalidation** since default `reselect` cache has a **limit of one**.

`re-reselect` **forwards different calls to different** `reselect` **selectors** stored in cache, so that computed/memoized values are retained.

`re-reselect` **selectors work as normal** `reselect` **selectors** but they are able to determine when **creating a new selector or querying a cached one** on the fly, depending on the supplied arguments.

Useful to:

- **Retain selector's cache** when sequentially **called with one/few different arguments**
- **Join similar selectors** into one
- **Share selectors** with props across multiple component instances
- **Instantiate** selectors **on runtime**
- Enhance `reselect` with [custom caching strategies](https://github.com/wrike/re-reselect/tree/master/lib/cache)

See [example](https://pub.dev/packages/re_reselect#-example-tab-) and [tests](https://github.com/wrike/re-reselect/tree/master/test) for details.