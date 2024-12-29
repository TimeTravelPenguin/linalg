
/// Calculate the dot product of two vectors.
/// #test(
/// `vector.dot((1, 2), (3, 4)) == 11`,
/// `vector.dot((1, 2, 3), (4, 5, 6)) == 32`,
/// `vector.dot((1, 2, 3, 4), (5, 6, 7, 8)) == 70`,
/// )
/// ```example
/// >>> #import vector: dot, norm
/// - #dot((1, 2), (3, 4))
/// - #dot((1, 2, 3), (4, 5, 6))
/// - #dot((1, 2, 3, 4), (5, 6, 7, 8))
///
/// Comparison with the norm:
/// #let v = (2, 0, 2, 5)
/// - #dot(v, v)
/// - #calc.pow(norm(v), 2)
/// ```
/// See also: @norm
/// -> float
#let dot(
  /// The first vector.
  /// -> array
  u,
  /// The second vector.
  /// -> array
  v,
) = {
  u.zip(v, exact: true).map(array.product).sum()
}

/// Calculate the norm of a vector.
/// #test(
/// `vector.norm((1, 2)) == calc.sqrt(5)`,
/// `vector.norm((1, 2, 3)) == calc.sqrt(14)`,
/// `vector.norm((1, 2, 3, 4)) == calc.sqrt(30)`,
/// `vector.norm((1, 2, 3, 4)) == calc.sqrt(vector.dot((1, 2, 3, 4), (1, 2, 3, 4)))`,
/// )
/// ```example
/// >>> #import vector: norm, dot
/// - #norm((1, 2))
/// - #norm((1, 2, 3))
/// - #norm((1, 2, 3, 4))
///
/// Comparison with the dot product:
/// #let v = (2, 0, 2, 5)
/// - #norm(v)
/// - #calc.sqrt(dot(v, v))
/// ```
/// See also: @dot
/// -> float
#let norm(
  /// The vector to calculate the norm of.
  /// -> array
  v,
) = {
  calc.sqrt((v.map(x => calc.pow(x, 2)).sum()))
}

/// Add two or more vectors.
/// #test(
/// `vector.add((1, 2), (3, 4)) == (4, 6)`,
/// `vector.add((1, 2, 3), (4, 5, 6)) == (5, 7, 9)`,
/// `vector.add((1, 2, 3, 4), (5, 6, 7, 8)) == (6, 8, 10, 12)`,
/// `vector.add((1, 2), (3, 4), (5, 6)) == (9, 12)`,
/// )
/// ```example
/// >>> #import vector: add
/// - #add((1, 2), (3, 4))
/// - #add((1, 2, 3), (4, 5, 6))
/// - #add((1, 2), (3, 4), (5, 6))
/// ```
/// -> array
#let add(
  /// The vectors to add.
  /// -> array
  ..vecs,
) = {
  let vecs = vecs.pos()
  array.zip(..vecs).map(array.sum)
}

#norm((1, 2))

#calc.sqrt(5)
