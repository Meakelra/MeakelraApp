//
//  PerformanceViewController.m
//  Meakelra
//
//  Created by 潘颖超 on 15/12/3.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "PerformanceViewController.h"

@interface PerformanceViewController ()

@end

@implementation PerformanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
     1. 用ARC管理内存
     
     ARC(Automatic ReferenceCounting, 自动引用计数)和iOS5一起发布，它避免了最常见的也就是经常是由于我们忘记释放内存所造成的内存泄露。它自动为你管理retain和release的过程，所以你就不必去手动干预了。忘掉代码段结尾的release简直像记得吃饭一样简单。而ARC会自动在底层为你做这些工作。除了帮你避免内存泄露，ARC还可以帮你提高性能，它能保证释放掉不再需要的对象的内存。
     */
     
     
     /*
     2. 在正确的地方使用 reuseIdentifier
     
     一个开发中常见的错误就是没有给UITableViewCells， UICollectionViewCells，甚至是UITableViewHeaderFooterViews设置正确的reuseIdentifier。
     
     为了性能最优化，table view用`tableView:cellForRowAtIndexPath:`为rows分配cells的时候，它的数据应该重用自UITableViewCell。一个table view维持一个队列的数据可重用的UITableViewCell对象。
     
     不使用reuseIdentifier的话，每显示一行table view就不得不设置全新的cell。这对性能的影响可是相当大的，尤其会使app的滚动体验大打折扣。
     
     自iOS6起，除了UICollectionView的cells和补充views，你也应该在header和footer views中使用reuseIdentifiers。
     
     想要使用reuseIdentifiers的话，在一个table view中添加一个新的cell时在data source object中添加这个方法：
     
     staticNSString *CellIdentifier = @"Cell";
     
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
     
     这个方法把那些已经存在的cell从队列中排除，或者在必要时使用先前注册的nib或者class创造新的cell。如果没有可重用的cell，你也没有注册一个class或者nib的话，这个方法返回nil。
     */
     
     /*
     3.尽量把views设置为透明
     
     如果你有透明的Views你应该设置它们的opaque属性为YES。
     
     原因是这会使系统用一个最优的方式渲染这些views。这个简单的属性在IB或者代码里都可以设定。
     
     Apple的文档对于为图片设置透明属性的描述是：
     
     (opaque)这个属性给渲染系统提供了一个如何处理这个view的提示。如果设为YES，渲染系统就认为这个view是完全不透明的，这使得渲染系统优化一些渲染过程和提高性能。如果设置为NO，渲染系统正常地和其它内容组成这个View。默认值是YES。
     
     在相对比较静止的画面中，设置这个属性不会有太大影响。然而当这个view嵌在scroll view里边，或者是一个复杂动画的一部分，不设置这个属性的话会在很大程度上影响app的性能。
     
     你可以在模拟器中用Debug\Color Blended Layers选项来发现哪些view没有被设置为opaque。目标就是，能设为opaque的就全设为opaque!
     */
     
     /*
     4.避免过于庞大的XIB
     
     iOS5中加入的Storyboards(分镜)正在快速取代XIB。然而XIB在一些场景中仍然很有用。比如你的app需要适应iOS5之前的设备，或者你有一个自定义的可重用的view,你就不可避免地要用到他们。
     
     如果你不得不XIB的话，使他们尽量简单。尝试为每个Controller配置一个单独的XIB，尽可能把一个View Controller的view层次结构分散到单独的XIB中去。
     
     需要注意的是，当你加载一个XIB的时候所有内容都被放在了内存里，包括任何图片。如果有一个不会即刻用到的view，你这就是在浪费宝贵的内存资源了。Storyboards就是另一码事儿了，storyboard仅在需要时实例化一个view controller.
     
     当家在XIB是，所有图片都被chache，如果你在做OS X开发的话，声音文件也是。Apple在相关文档中的记述是：
     
     当你加载一个引用了图片或者声音资源的nib时，nib加载代码会把图片和声音文件写进内存。在OS X中，图片和声音资源被缓存在named cache中以便将来用到时获取。在iOS中，仅图片资源会被存进named caches。取决于你所在的平台，使用NSImage 或UIImage的`imageNamed:`方法来获取图片资源。
     */
     
     /*
     5.不要阻塞主线程
     
     永远不要使主线程承担过多。因为UIKit在主线程上做所有工作，渲染，管理触摸反应，回应输入等都需要在它上面完成。
     
     一直使用主线程的风险就是如果你的代码真的block了主线程，你的app会失去反应。
     
     大部分阻碍主进程的情形是你的app在做一些牵涉到读写外部资源的I/O操作，比如存储或者网络。
     
     你可以使用`NSURLConnection`异步地做网络操作:
     
     + (void)sendAsynchronousRequest:(NSURLRequest *)request queue:(NSOperationQueue*)queue completionHandler:(void (^)(NSURLResponse*, NSData*, NSError*))handler
     
     或者使用像AFNetworking这样的框架来异步地做这些操作。
     
     如果你需要做其它类型的需要耗费巨大资源的操作(比如时间敏感的计算或者存储读写)那就用 Grand Central Dispatch，或者NSOperation和 NSOperationQueues.
     
     下面代码是使用GCD的模板
     
     dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
     
     // switch to a background thread and perform your expensive operation
     
     dispatch_async(dispatch_get_main_queue(), ^{
     
     // switch back to the main thread to update your UI
     
     });
     
     });
     
     发现代码中有一个嵌套的`dispatch_async`吗？这是因为任何UIKit相关的代码需要在主线程上进行。
     */
     
     /*
     6. 在Image Views中调整图片大小
     
     如果要在`UIImageView`中显示一个来自bundle的图片，你应保证图片的大小和UIImageView的大小相同。在运行中缩放图片是很耗费资源的，特别是`UIImageView`嵌套在`UIScrollView`中的情况下。
     
     如果图片是从远端服务加载的你不能控制图片大小，比如在下载前调整到合适大小的话，你可以在下载完成后，最好是用background thread，缩放一次，然后在UIImageView中使用缩放后的图片。
     */
     
     /*
     7. 选择正确的Collection
     
     学会选择对业务场景最合适的类或者对象是写出能效高的代码的基础。当处理collections时这句话尤其正确。
     
     一些常见collection的总结：
     
     · Arrays: 有序的一组值。使用index来lookup很快，使用value lookup很慢，插入/删除很慢。
     
     · Dictionaries: 存储键值对。用键来查找比较快。
     
     · Sets: 无序的一组值。用值来查找很快，插入/删除很快。
     */
     
     /*
     8. 打开gzip压缩
     
     大量app依赖于远端资源和第三方API，你可能会开发一个需要从远端下载XML, JSON, HTML或者其它格式的app。
     
     问题是我们的目标是移动设备，因此你就不能指望网络状况有多好。一个用户现在还在edge网络，下一分钟可能就切换到了3G。不论什么场景，你肯定不想让你的用户等太长时间。
     
     减小文档的一个方式就是在服务端和你的app中打开gzip。这对于文字这种能有更高压缩率的数据来说会有更显著的效用。
     
     好消息是，iOS已经在NSURLConnection中默认支持了gzip压缩，当然AFNetworking这些基于它的框架亦然。像Google App Engine这些云服务提供者也已经支持了压缩输出。
     */
     
     /*
     9. 重用和延迟加载(lazy load) Views
     
     更多的view意味着更多的渲染，也就是更多的CPU和内存消耗，对于那种嵌套了很多view在UIScrollView里边的app更是如此。
     
     这里我们用到的技巧就是模仿`UITableView`和`UICollectionView`的操作:不要一次创建所有的subview，而是当需要时才创建，当它们完成了使命，把他们放进一个可重用的队列中。
     
     这样的话你就只需要在滚动发生时创建你的views，避免了不划算的内存分配。
     
     创建views的能效问题也适用于你app的其它方面。想象一下一个用户点击一个按钮的时候需要呈现一个view的场景。有两种实现方法：
     
     1. 创建并隐藏这个view当这个screen加载的时候，当需要时显示它；
     
     2. 当需要时才创建并展示。
     
     每个方案都有其优缺点。用第一种方案的话因为你需要一开始就创建一个view并保持它直到不再使用，这就会更加消耗内存。然而这也会使你的app操作更敏感因为当用户点击按钮的时候它只需要改变一下这个view的可见性。
     
     第二种方案则相反-消耗更少内存，但是会在点击按钮的时候比第一种稍显卡顿。
     */
     
     /*
     10. Cache, Cache, 还是Cache!
     
     一个极好的原则就是，缓存所需要的，也就是那些不大可能改变但是需要经常读取的东西。
     
     我们能缓存些什么呢？一些选项是，远端服务器的响应，图片，甚至计算结果，比如UITableView的行高。
     
     NSURLConnection默认会缓存资源在内存或者存储中根据它所加载的HTTP Headers。你甚至可以手动创建一个NSURLRequest然后使它只加载缓存的值。
     
     下面是一个可用的代码段，你可以可以用它去为一个基本不会改变的图片创建一个NSURLRequest并缓存它：
     
     + (NSMutableURLRequest *)imageRequestWithURL:(NSURL *)url {
     
     NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
     
     request.cachePolicy = NSURLRequestReturnCacheDataElseLoad;// this will make sure the request always returns the cached image
     
     request.HTTPShouldHandleCookies = NO;
     
     request.HTTPShouldUsePipelining = YES;
     
     [request addValue:@"image"forHTTPHeaderField:@"Accept"];
     
     return request;
     
     }
     
     注意你可以通过 NSURLConnection 获取一个URL request， AFNetworking也一样的。这样你就不必为采用这条tip而改变所有的networking代码了。
     
     
     
     如果你需要缓存其它不是HTTP Request的东西，你可以用NSCache。
     
     NSCache和NSDictionary类似，不同的是系统回收内存的时候它会自动删掉它的内容。
     */
     
     /*
     11.权衡渲染方法
     
     在iOS中可以有很多方法做出漂亮的按钮。你可以用整幅的图片，可调大小的图片，uozhe可以用CALayer， CoreGraphics甚至OpenGL来画它们。
     
     当然每个不同的解决方法都有不同的复杂程度和相应的性能。
     
     简单来说，就是用事先渲染好的图片更快一些，因为如此一来iOS就免去了创建一个图片再画东西上去然后显示在屏幕上的程序。问题是你需要把所有你需要用到的图片放到app的bundle里面，这样就增加了体积–这就是使用可变大小的图片更好的地方了:你可以省去一些不必要的空间，也不需要再为不同的元素(比如按钮)来做不同的图。
     
     然而，使用图片也意味着你失去了使用代码调整图片的机动性，你需要一遍又一遍不断地重做他们，这样就很浪费时间了，而且你如果要做一个动画效果，虽然每幅图只是一些细节的变化你就需要很多的图片造成bundle大小的不断增大。
     
     总得来说，你需要权衡一下利弊，到底是要性能能还是要bundle保持合适的大小。
     */
     
     /*
     12.处理内存警告
     
     一旦系统内存过低，iOS会通知所有运行中app。在官方文档中是这样记述:
     
     如果你的app收到了内存警告，它就需要尽可能释放更多的内存。最佳方式是移除对缓存，图片object和其他一些可以重创建的objects的strong references.
     
     幸运的是，UIKit提供了几种收集低内存警告的方法:
     
     · 在app delegate中使用`applicationDidReceiveMemoryWarning:`的方法
     
     · 在你的自定义UIViewController的子类(subclass)中覆盖`didReceiveMemoryWarning`
     
     · 注册并接收 UIApplicationDidReceiveMemoryWarningNotification的通知
     
     一旦收到这类通知，你就需要释放任何不必要的内存使用。
     
     例如，UIViewController的默认行为是移除一些不可见的view，它的一些子类则可以补充这个方法，删掉一些额外的数据结构。一个有图片缓存的app可以移除不在屏幕上显示的图片。
     
     这样对内存警报的处理是很必要的，若不重视，你的app就可能被系统杀掉。
     
     然而，当你一定要确认你所选择的object是可以被重现创建的来释放内存。一定要在开发中用模拟器中的内存提醒模拟去测试一下。
     */
     
     /*
     13.重用大开销对象
     
     一些objects的初始化很慢，比如NSDateFormatter和NSCalendar。然而，你又不可避免地需要使用它们，比如从JSON或者XML中解析数据。
     
     想要避免使用这个对象的瓶颈你就需要重用他们，可以通过添加属性到你的class里或者创建静态变量来实现。
     
     注意如果你要选择第二种方法，对象会在你的app运行时一直存在于内存中，和单例(singleton)很相似。
     
     下面的代码说明了使用一个属性来延迟加载一个date formatter. 第一次调用时它会创建一个新的实例，以后的调用则将返回已经创建的实例：
     
     // in your .h or inside a class extension
     
     @property (nonatomic, strong) NSDateFormatter *formatter;
     
     // inside the implementation (.m)
     
     // When you need, just use self.formatter
     
     - (NSDateFormatter *)formatter {
     
     if(! _formatter) {
     
     _formatter = [[NSDateFormatter alloc] init];
     
     _formatter.dateFormat = @"EEE MMM dd HH:mm:ss Z yyyy";// twitter date format
     
     }
     
     return_formatter;
     
     }
     
     还需要注意的是，其实设置一个NSDateFormatter的速度差不多是和创建新的一样慢的！所以如果你的app需要经常进行日期格式处理的话，你会从这个方法中得到不小的性能提升。
     */
     
     /*
     14. 使用Sprite Sheets
     
     Sprite sheet可以让渲染速度加快，甚至比标准的屏幕渲染方法节省内存。
     */
     
     /*
     15.避免反复处理数据
     
     许多应用需要从服务器加载功能所需的常为JSON或者XML格式的数据。在服务器端和客户端使用相同的数据结构很重要。在内存中操作数据使它们满足你的数据结构是开销很大的。
     
     比如你需要数据来展示一个table view,最好直接从服务器取array结构的数据以避免额外的中间数据结构改变。
     
     类似的，如果需要从特定key中取数据，那么就使用键值对的dictionary。
     */
     
     /*
     16.选择正确的数据格式
     
     
     
     从app和网络服务间传输数据有很多方案，最常见的就是JSON和XML。你需要选择对你的app来说最合适的一个。
     
     解析JSON会比XML更快一些，JSON也通常更小更便于传输。从iOS5起有了官方内建的JSON deserialization就更加方便使用了。
     
     但是XML也有XML的好处，比如使用SAX来解析XML就像解析本地文件一样，你不需像解析json一样等到整个文档下载完成才开始解析。当你处理很大的数据的时候就会极大地减低内存消耗和增加性能。
     */
     
     /*
     17.正确设定背景图片
     
     在View里放背景图片就像很多其它iOS编程一样有很多方法:
     
     使用UIColor的 colorWithPatternImage来设置背景色；
     
     在view中添加一个UIImageView作为一个子View。
     
     如果你使用全画幅的背景图，你就必须使用UIImageView因为UIColor的colorWithPatternImage是用来创建小的重复的图片作为背景的。这种情形下使用UIImageView可以节约不少的内存：
     
     // You could also achieve the same result in Interface Builder
     
     UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];
     
     [self.view addSubview:backgroundView];
     
     如果你用小图平铺来创建背景，你就需要用UIColor的colorWithPatternImage来做了，它会更快地渲染也不会花费很多内存：
     
     self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
     */
     
     /*
     18. 减少使用Web特性
     
     UIWebView很有用，用它来展示网页内容或者创建UIKit很难做到的动画效果是很简单的一件事。
     
     但是你可能有注意到UIWebView并不像驱动Safari的那么快。这是由于以JIT compilation为特色的Webkit的Nitro Engine的限制。
     
     所以想要更高的性能你就要调整下你的HTML了。第一件要做的事就是尽可能移除不必要的javascript，避免使用过大的框架。能只用原生js就更好了。
     
     另外，尽可能异步加载例如用户行为统计script这种不影响页面表达的javascript。
     
     最后，永远要注意你使用的图片，保证图片的符合你使用的大小。使用Sprite sheet提高加载速度和节约内存。
     */
     
     /*
     19. 设定Shadow Path
     
     如何在一个View或者一个layer上加一个shadow呢，QuartzCore框架是很多开发者的选择：
     
     #import
     
     // Somewhere later ...
     
     UIView *view = [[UIView alloc] init];
     
     // Setup the shadow ...
     
     view.layer.shadowOffset = CGSizeMake(-1.0f, 1.0f);
     
     view.layer.shadowRadius = 5.0f;
     
     view.layer.shadowOpacity = 0.6;
     
     看起来很简单，对吧。可是，坏消息是使用这个方法也有它的问题… Core Animation不得不先在后台得出你的图形并加好阴影然后才渲染，这开销是很大的。
     
     使用shadowPath的话就避免了这个问题：
     
     view.layer.shadowPath = [[UIBezierPath bezierPathWithRect:view.bounds] CGPath];
     
     使用shadow path的话iOS就不必每次都计算如何渲染，它使用一个预先计算好的路径。但问题是自己计算path的话可能在某些View中比较困难，且每当view的frame变化的时候你都需要去update shadow path.
     */
     
     /*
     20. 优化Table View
     
     Table view需要有很好的滚动性能，不然用户会在滚动过程中发现动画的瑕疵。
     
     为了保证table view平滑滚动，确保你采取了以下的措施:
     
     · 正确使用`reuseIdentifier`来重用cells
     
     · 尽量使所有的view opaque，包括cell自身
     
     · 避免渐变，图片缩放，后台选人
     
     · 缓存行高
     
     · 如果cell内现实的内容来自web，使用异步加载，缓存请求结果
     
     · 使用`shadowPath`来画阴影
     
     · 减少subviews的数量
     
     · 尽量不适用`cellForRowAtIndexPath:`，如果你需要用到它，只用一次然后缓存结果
     
     · 使用正确的数据结构来存储数据
     
     · 使用`rowHeight`, `sectionFooterHeight`和 `sectionHeaderHeight`来设定固定的高，不要请求delegate
     */
     
     /*
     21.选择正确的数据存储选项
     
     当存储大块数据时你会怎么做？
     
     你有很多选择，比如：
     
     · 使用`NSUerDefaults`
     
     · 使用XML, JSON, 或者 plist
     
     · 使用NSCoding存档
     
     · 使用类似SQLite的本地SQL数据库
     
     · 使用 Core Data
     
     NSUserDefaults的问题是什么？虽然它很nice也很便捷，但是它只适用于小数据，比如一些简单的布尔型的设置选项，再大点你就要考虑其它方式了
     
     XML这种结构化档案呢？总体来说，你需要读取整个文件到内存里去解析，这样是很不经济的。使用SAX又是一个很麻烦的事情。
     
     NSCoding？不幸的是，它也需要读写文件，所以也有以上问题。
     
     在这种应用场景下，使用SQLite 或者 Core Data比较好。使用这些技术你用特定的查询语句就能只加载你需要的对象。
     
     在性能层面来讲，SQLite和Core Data是很相似的。他们的不同在于具体使用方法。Core Data代表一个对象的graph model，但SQLite就是一个DBMS。Apple在一般情况下建议使用Core Data，但是如果你有理由不使用它，那么就去使用更加底层的SQLite吧。
     
     如果你使用SQLite，你可以用FMDB(https://GitHub.com/ccgus/fmdb)这个库来简化SQLite的操作，这样你就不用花很多经历了解SQLite的C API了。
     */
     
     /*
     23. 使用Autorelease Pool
     
     `NSAutoreleasePool`负责释放block中的autoreleased objects。一般情况下它会自动被UIKit调用。但是有些状况下你也需要手动去创建它。
     
     假如你创建很多临时对象，你会发现内存一直在减少直到这些对象被release的时候。这是因为只有当UIKit用光了autorelease pool的时候memory才会被释放。好消息是你可以在你自己的@autoreleasepool里创建临时的对象来避免这个行为：
     
     NSArray *urls = <# An array of file URLs #>;
     
     for(NSURL *url in urls) {
     
     @autoreleasepool {
     
     NSError *error;
     
     NSString *fileContents = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
     
     
     
      //Process the string, creating and autoreleasing more objects.
            }
      }
      这段代码在每次遍历后释放所有autorelease对象
      */


    /*
     24. 选择是否缓存图片

     常见的从bundle中加载图片的方式有两种，一个是用`imageNamed`，二是用`imageWithContentsOfFile`，第一种比较常见一点。
     
     既然有两种类似的方法来实现相同的目的，那么他们之间的差别是什么呢？

     `imageNamed`的优点是当加载时会缓存图片。`imageNamed`的文档中这么说:这个方法用一个指定的名字在系统缓存中查找并返回一个图片对象如果它存在的话。如果缓存中没有找到相应的图片，这个方法从指定的文档中加载然后缓存并返回这个对象。

     相反的，`imageWithContentsOfFile`仅加载图片。

     下面的代码说明了这两种方法的用法:

     UIImage *img = [UIImage imageNamed:@"myImage"];// caching

     // or

     UIImage *img = [UIImage imageWithContentsOfFile:@"myImage"];// no caching

     那么我们应该如何选择呢？

     如果你要加载一个大图片而且是一次性使用，那么就没必要缓存这个图片，用`imageWithContentsOfFile`足矣，这样不会浪费内存来缓存它。

     然而，在图片反复重用的情况下`imageNamed`是一个好得多的选择。
     */

    /*
     25. 避免日期格式转换

     如果你要用`NSDateFormatter`来处理很多日期格式，应该小心以待。就像先前提到的，任何时候重用`NSDateFormatters`都是一个好的实践。

     然而，如果你需要更多速度，那么直接用C是一个好的方案。Sam Soffes有一个不错的帖子(http://soff.es/how-to-drastically-improve-your-app-with-an-afternoon-and-instruments)里面有一些可以用来解析ISO-8601日期字符串的代码，简单重写一下就可以拿来用了。
                                              
     嗯，直接用C来搞，看起来不错了，但是你相信吗，我们还有更好的方案！
                                              
     如果你可以控制你所处理的日期格式，尽量选择Unix时间戳。你可以方便地从时间戳转换到NSDate:
                                              
     - (NSDate*)dateFromUnixTimestamp:(NSTimeInterval)timestamp {
                                                  
        return[NSDate dateWithTimeIntervalSince1970:timestamp];
     
     }
                                              
     这样会比用C来解析日期字符串还快！需要注意的是，许多web API会以微秒的形式返回时间戳，因为这种格式在javascript中更方便使用。记住用`dateFromUnixTimestamp`之前除以1000就好了。
     */
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
