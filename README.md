### How to Add Sticky Section Headers to a Collection View

#### Author: Bart Jacobs

Even though `UICollectionView` is incredibly flexible and versatile, trivial things are sometimes difficult to accomplish. `UITableView`, on the other hand, has more configuration options, but it is harder to customize. Sticky section headers, for example, are built into table views. Adding them to a collection view requires a bit of extra work.

If your project targets iOS 9 or higher, then you are in luck. Since iOS 9, the `UICollectionViewFlowLayout` class has two properties, `sectionHeadersPinToVisibleBounds` and `sectionFootersPinToVisibleBounds`, that make it very easy to make section headers and section footers sticky. It is no coincidence that these properties are members of the `UICollectionViewFlowLayout` class. It is `UICollectionViewFlowLayout` we need to subclass to add sticky section headers.

**Read this article on the [blog](https://cocoacasts.com/how-to-add-sticky-section-headers-to-a-collection-view/)**.
