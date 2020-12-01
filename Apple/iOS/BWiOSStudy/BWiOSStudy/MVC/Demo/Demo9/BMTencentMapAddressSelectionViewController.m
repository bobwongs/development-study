//
//  BMTencentMapAddressSelectionViewController.m
//  BWiOSStudy
//
//  Created by BobWong on 2020/11/27.
//  Copyright © 2020 BobWongStudio. All rights reserved.
//

#import "BMTencentMapAddressSelectionViewController.h"

// 腾讯地图
#import <QMapKit/QMapKit.h>
#import <QMapKit/QMSSearchKit.h>

#define BM_SEARCH_BAR_HEIGHT 44.0
#define BM_TABLE_VIEW_HEIGHT 350.0

@interface BMTencentMapAddressSelectionViewController () <QMapViewDelegate, QMSSearchDelegate, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>

// UI
@property (nonatomic, strong) UIView *searchView;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UITableView *searchResultTableView;
@property (nonatomic, strong) QMapView *mapView;
@property (nonatomic, strong) QMSSearcher *mapSearcher;
@property (nonatomic, strong) QPointAnnotation *annotation;
@property (nonatomic, strong) QPinAnnotationView *pinView;
@property (nonatomic, strong) UIButton *toCurrentLocationButton;  ///< 定位到当前位置按钮

// Search Data
@property (nonatomic, strong) NSArray *searchResultArray;
@property (nonatomic, assign) NSInteger search_data_page_index;  ///< 搜索数据页签记录，初始为1
@property (nonatomic, copy) NSString *searchKeyword;  ///< 搜索关键词

// Location Data
@property (nonatomic, strong) QUserLocation *currentLocation;  ///< 当前定位的位置
@property (nonatomic, assign) NSInteger selectedIndex;  // 选中序列

@end

@implementation BMTencentMapAddressSelectionViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"位置";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self setNavigationBar];
    [self checkLocatingPrivacy];
    [self setupMapView];
    [self setupToCurrentLocationButton];
    [self setupSearchView];
    [self setupKeyboardNotification];
    
    // 初始搜索
    if (_initialSelectedLocation) {
        [self searchWithInitialSelectedLocation];
    } else {
        [self searchCurrentLocation];
    }
}

- (void)dealloc {
    NSLog(@"Dealloc %@", NSStringFromClass([self class]));
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/** 检查定位权限 */
- (void)checkLocatingPrivacy {
    CLAuthorizationStatus authorizationStatus = [CLLocationManager authorizationStatus];
    if (authorizationStatus == kCLAuthorizationStatusDenied ||
        authorizationStatus == kCLAuthorizationStatusRestricted) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示"
                                                                       message:@"定位权限未开启，是否开启？"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"是"
                                                  style:UIAlertActionStyleDefault
                                                handler:^(UIAlertAction * _Nonnull action) {
            if( [[UIApplication sharedApplication]canOpenURL:
                [NSURL URLWithString:UIApplicationOpenSettingsURLString]] ) {
                [[UIApplication sharedApplication] openURL:
                    [NSURL URLWithString:UIApplicationOpenSettingsURLString]];
            }
        }]];

        [alert addAction:[UIAlertAction actionWithTitle:@"否"
                                                  style:UIAlertActionStyleDefault
                                                handler:^(UIAlertAction * _Nonnull action) {
        }]];

        [self presentViewController:alert animated:true completion:nil];
    }
}

/** 设置MapView */
- (void)setupMapView {
    self.mapView = [[QMapView alloc] init];
    self.mapView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - BM_SEARCH_BAR_HEIGHT - BM_TABLE_VIEW_HEIGHT);
    self.mapView.delegate = self;
    // 开启定位
    [self.mapView setShowsUserLocation:YES];
//    [self.mapView setCenterCoordinate:CLLocationCoordinate2DMake(40.040219,116.273348)];
    [self.mapView setZoomLevel:15.0];
    [self.view addSubview:self.mapView];
    
    // 创建定位样式对象
    QUserLocationPresentation *presentation = [[QUserLocationPresentation alloc] init];
    // 定位图标
    presentation.icon = [UIImage imageNamed:@"tc_map_icon_point"];
    // 配置定位样式
    [self.mapView configureUserLocationPresentation:presentation];
}

- (void)setupToCurrentLocationButton {
    CGFloat buttonInsetSpace = 11.0;
    CGFloat buttonWidth = 22.0 + buttonInsetSpace * 2;
    CGFloat buttonSpaceHorizonal = 20.0, buttonSpaceVertical = 30;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(CGRectGetMaxX(self.mapView.frame) - buttonSpace - buttonWidth, CGRectGetMaxY(self.mapView.frame) - buttonSpace - buttonWidth, buttonWidth, buttonWidth);
    button.imageEdgeInsets = UIEdgeInsetsMake(buttonInsetSpace, buttonInsetSpace, buttonInsetSpace, buttonInsetSpace);
    [button setImage:[UIImage imageNamed:@"tc_map_icon_located_blue"] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor colorWithRed:76.0 / 255 green:76.0 / 255 blue:76.0 / 255 alpha:1];
    [button addTarget:self action:@selector(toCurrentLocationAction) forControlEvents:UIControlEventTouchUpInside];
    button.clipsToBounds = YES;
    button.layer.cornerRadius = buttonWidth / 2.0;
    [self.view addSubview:button];
}

/** 设置大头针位置 */
- (void)setupPointAnnotationWithCoordinate:(CLLocationCoordinate2D)coordinate {
    _annotation = [[QPointAnnotation alloc] init];
    _annotation.coordinate = coordinate;
    [self.mapView addAnnotation:_annotation];
}

- (void)setNavigationBar {
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(dismissVC)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(confirmAction)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

#pragma mark - Action

- (void)dismissVC {
    NSLog(@"%@ dismiss", NSStringFromClass([self class]));
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)confirmAction {
    NSLog(@"%@ confirm", NSStringFromClass([self class]));
    QMSPoiData *data = _searchResultArray[_selectedIndex];
    CLLocationCoordinate2D location = data.location;
    NSLog(@"Confirm Action Location - longitude: %.6f, latitude: %.6f", location.longitude, location.latitude);
    if (_confirmSelection) _confirmSelection(location);
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

/** 到当前位置 */
- (void)toCurrentLocationAction {
    if (self.currentLocation) {
        [self.mapView setCenterCoordinate:self.currentLocation.location.coordinate];
    }
}

#pragma mark - Search

/** 搜索初始选中位置 */
- (void)searchWithInitialSelectedLocation {
    // 重设地图中心位置
    [self.mapView setCenterCoordinate:_initialSelectedLocation.coordinate];
    // 设值大头针位置
    [self setupPointAnnotationWithCoordinate:_initialSelectedLocation.coordinate];
    // 搜索
    _search_data_page_index = 1;
    [self searchCurrentLocation];
}

/** 搜索 */
- (void)searchCurrentLocation {
    // 地点搜索
    QMSPoiSearchOption *option = [[QMSPoiSearchOption alloc] init];
    // page_size
    option.page_size = 20;
    // page_index。从1开始
    option.page_index = _search_data_page_index < 1 ? 1 : _search_data_page_index;
    // 关键词
    option.keyword = _searchKeyword;
    // 中心坐标，附近1000米
    CLLocationCoordinate2D centerCoord = self.mapView.centerCoordinate;
    option.boundary = [NSString stringWithFormat:@"nearby(%f,%f,1000,1)", centerCoord.latitude, centerCoord.longitude];
    // 开始搜索
    [self.mapSearcher searchWithPoiSearchOption:option];
}

#pragma mark - QMapViewDelegate

- (void)mapView:(QMapView *)mapView didUpdateUserLocation:(QUserLocation *)userLocation fromHeading:(BOOL)fromHeading {
    NSLog(@"%s fromHeading = %d, location = %@, heading = %@", __FUNCTION__, fromHeading, userLocation.location, userLocation.heading);
    
    if (!userLocation) return;
    
    // 记录当前位置
    _currentLocation = userLocation;
    if (!_initialSelectedLocation) {
        // 若无初始选中位置，则记录一次选中位置，并且“选中”和“把地图中心移动到当前位置”
        _initialSelectedLocation = userLocation.location;
        [self searchWithInitialSelectedLocation];
    }
}

- (QAnnotationView *)mapView:(QMapView *)mapView viewForAnnotation:(id<QAnnotation>)annotation {
    if ([annotation isKindOfClass:[QPointAnnotation class]]) {
        static NSString *pinIndentifier = @"PinIndentifier";
        _pinView = (QPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:pinIndentifier];
        if (_pinView == nil) {
            _pinView = [[QPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pinIndentifier];
            _pinView.image = [UIImage imageNamed:@"tc_map_icon_nail"];
        }
        
        return _pinView;
    }
    
    return nil;
}

- (void)mapView:(QMapView *)mapView regionWillChangeAnimated:(BOOL)animated gesture:(BOOL)bGesture {
    [self.view endEditing:YES];
}

- (void)mapViewRegionChange:(QMapView *)mapView {
    // 更新位置
    _annotation.coordinate = mapView.centerCoordinate;
}

// 请求当前位置的地标
- (void)mapView:(QMapView *)mapView regionDidChangeAnimated:(BOOL)animated gesture:(BOOL)bGesture {
    if (bGesture == YES) {
        _searchBar.text = @"";
        
        // 判断与上次坐标是否相同
    //        CLLocationCoordinate2D centerCoord = mapView.centerCoordinate;
    //        if (_lastLocation.latitude == centerCoord.latitude && _lastLocation.longitude == centerCoord.longitude) {
    //            return;
    //        }
        
        // 请求当前地点
        _search_data_page_index = 1;
        [self searchCurrentLocation];
    }
    
    _annotation.coordinate = mapView.centerCoordinate;
}

- (void)searchWithPoiSearchOption:(QMSPoiSearchOption *)poiSearchOption didReceiveResult:(QMSPoiSearchResult *)poiSearchResult {
    NSLog(@"%@", poiSearchResult);
    
    // 若为第一页：重刷数据；移动到第一个位置
    if (poiSearchOption.page_index == 1) {
        _searchResultArray = @[];
        
        // 地图移动到搜索结果的第一个位置
        _selectedIndex = 0;
        if (_searchBar.text.length) {
            QMSPoiData *firstData = poiSearchResult.dataArray[0];
            _annotation.coordinate = firstData.location;
            [self.mapView setCenterCoordinate:firstData.location animated:YES];
        }
        
        // 返回列表顶部
        [self.searchResultTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:NSNotFound inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }
    
    // 有数据则拼接
    if (poiSearchResult.count) {
        _searchResultArray = [_searchResultArray arrayByAddingObjectsFromArray:poiSearchResult.dataArray];
    }
    
    [_searchResultTableView reloadData];
}

#pragma mark - SearchBar

- (void)setupSearchView {
    _searchView = [[UIView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - BM_SEARCH_BAR_HEIGHT - BM_TABLE_VIEW_HEIGHT, [UIScreen mainScreen].bounds.size.width, BM_SEARCH_BAR_HEIGHT + BM_TABLE_VIEW_HEIGHT)];
//    _searchView.backgroundColor = [UIColor systemGroupedBackgroundColor];
    [self.view addSubview:_searchView];
    
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
//    _searchBar.showsCancelButton = YES;
    _searchBar.delegate = self;
    [_searchView addSubview:_searchBar];
    
    _searchResultTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, [UIScreen mainScreen].bounds.size.width, BM_TABLE_VIEW_HEIGHT) style:UITableViewStyleGrouped];
//    _searchResultTableView.backgroundColor = [UIColor systemGroupedBackgroundColor];
    _searchResultTableView.dataSource = self;
    _searchResultTableView.delegate = self;
    _searchResultTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0.01, 0.01)];
    [_searchView addSubview:_searchResultTableView];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    searchBar.showsCancelButton = YES;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    searchBar.showsCancelButton = NO;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self.view endEditing:YES];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    _searchKeyword = searchBar.text;
    _search_data_page_index = 1;
    [self searchCurrentLocation];
}

#pragma mark - TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _searchResultArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *searchCellIdentifier = @"SearchCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:searchCellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:searchCellIdentifier];
    }
    
    QMSPoiData *data = _searchResultArray[indexPath.row];
    cell.textLabel.text = data.title;
    cell.detailTextLabel.text = data.address;
    
    if (indexPath.row == _selectedIndex) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    _selectedIndex = indexPath.row;
    QMSPoiData *data = _searchResultArray[_selectedIndex];
    
    // 更新位置
    [self.mapView setCenterCoordinate:data.location animated:YES];
    
    [self.searchResultTableView reloadData];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row + 1 == _searchResultArray.count) {
        NSLog(@"Trigger load more data event.");

        UIActivityIndicatorView *spinner;
        if (@available(iOS 13.0, *)) {
            spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleMedium];
        } else {
            spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        }
        [spinner startAnimating];
        spinner.frame = CGRectMake(0, 0, tableView.bounds.size.width, 44);
        self.searchResultTableView.tableFooterView = spinner;
        self.searchResultTableView.tableFooterView.hidden = NO;
        
       _search_data_page_index += 1;
        [self searchCurrentLocation];
    }
}

#pragma mark - Keyboard

- (void)setupKeyboardNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWillShow:(NSNotification *)notification {
    // 获取键盘的高度
    NSDictionary *userInfo = [notification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    int height = keyboardRect.size.height;
    
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.2 animations:^{
        weakSelf.searchView.frame = CGRectMake(0, 0, weakSelf.searchView.bounds.size.width, self.view.frame.size.height);
        weakSelf.searchResultTableView.frame = CGRectMake(0, weakSelf.searchBar.frame.size.height, [UIScreen mainScreen].bounds.size.width, self.view.frame.size.height - height - weakSelf.searchBar.frame.size.height);
    }];
}

- (void)keyboardWillHide:(NSNotification *)notification {
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.2 animations:^{
        weakSelf.searchView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - BM_SEARCH_BAR_HEIGHT - BM_TABLE_VIEW_HEIGHT, [UIScreen mainScreen].bounds.size.width, BM_SEARCH_BAR_HEIGHT + BM_TABLE_VIEW_HEIGHT);
        weakSelf.searchResultTableView.frame = CGRectMake(0, weakSelf.searchBar.frame.size.height, [UIScreen mainScreen].bounds.size.width, weakSelf.searchView.frame.size.height - weakSelf.searchBar.frame.size.height);
    }];
}

#pragma mark - Lazy Load

- (QMSSearcher *)mapSearcher {
    if (_mapSearcher == nil) {
        _mapSearcher = [[QMSSearcher alloc] initWithDelegate:self];
    }
    return _mapSearcher;
}

@end
