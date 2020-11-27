//
//  Demo9ViewController.m
//  BWiOSStudy
//
//  Created by BobWong on 2020/11/27.
//  Copyright © 2020 BobWongStudio. All rights reserved.
//

#import "Demo9ViewController.h"

// 腾讯地图
#import <QMapKit/QMapKit.h>
#import <QMapKit/QMSSearchKit.h>

#define BM_SEARCH_BAR_HEIGHT 44.0
#define BM_TABLE_VIEW_HEIGHT 350.0

@interface Demo9ViewController () <QMapViewDelegate, QMSSearchDelegate, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>

// UI
@property (nonatomic, strong) UIView *searchView;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UITableView *searchResultTableView;
@property (nonatomic, strong) QMapView *mapView;
@property (nonatomic, strong) QMSSearcher *mapSearcher;
@property (nonatomic, strong) QPointAnnotation *annotation;
@property (nonatomic, strong) QPinAnnotationView *pinView;

// Data
@property (nonatomic, strong) NSArray *searchResultArray;
@property (nonatomic, strong) QUserLocation *currentLocation;  ///< 当前位置信息
@property (nonatomic, strong) QUserLocation *selectedLocation;  ///< 选中位置信息
//@property (nonatomic, assign) CLLocationCoordinate2D selectedCoordinate;  // 选中坐标的经纬度
//@property (nonatomic, assign) CLLocationCoordinate2D lastLocation;
@property (nonatomic, assign) NSInteger selectedIndex;

@end

@implementation Demo9ViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"位置";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self setupMapView];
    [self searchCurrentLocationWithKeyword:@""];
    [self setupSearchView];
    [self setupKeyboardNotification];
    [self setNavigationBar];
//    [self setupPointAnnotation];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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

- (void)setupPointAnnotation {
    _annotation = [[QPointAnnotation alloc] init];
    _annotation.coordinate = _selectedLocation.location.coordinate;
    [self.mapView addAnnotation:_annotation];
//    [self.mapView setCenterCoordinate:_annotation.coordinate];
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
    if (_confirmSelection) {
#warning Todo
//        _confirmSelection();
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - QMapViewDelegate

- (void)mapView:(QMapView *)mapView didUpdateUserLocation:(QUserLocation *)userLocation fromHeading:(BOOL)fromHeading {
    NSLog(@"%s fromHeading = %d, location = %@, heading = %@", __FUNCTION__, fromHeading, userLocation.location, userLocation.heading);
    _currentLocation = userLocation;
    
    // Todo: confirm structure data valid.
    if (!_selectedLocation) {
        _selectedLocation = userLocation;
        [self setupPointAnnotation];
        [self.mapView setCenterCoordinate:userLocation.location.coordinate];
    }
}

- (QAnnotationView *)mapView:(QMapView *)mapView viewForAnnotation:(id<QAnnotation>)annotation {
    if ([annotation isKindOfClass:[QPointAnnotation class]]) {
        static NSString *pinIndentifier = @"PinIndentifier";
        _pinView = (QPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:pinIndentifier];
        if (_pinView == nil) {
            _pinView = [[QPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pinIndentifier];
            _pinView.image = [UIImage imageNamed:@"tc_map_icon_nail_100"];
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
        [self searchCurrentLocationWithKeyword:@""];
    }
    
    _annotation.coordinate = mapView.centerCoordinate;
}

- (void)searchCurrentLocationWithKeyword:(NSString *)keyword {
    CLLocationCoordinate2D centerCoord = self.mapView.centerCoordinate;
    
    QMSPoiSearchOption *option = [[QMSPoiSearchOption alloc] init];
    if (keyword.length > 0) {
        option.keyword = keyword;
    }
    option.boundary = [NSString stringWithFormat:@"nearby(%f,%f,2000,1)", centerCoord.latitude, centerCoord.longitude];
//    [option setFilter:@"category=美食"];
    [self.mapSearcher searchWithPoiSearchOption:option];
}

- (void)searchWithPoiSearchOption:(QMSPoiSearchOption *)poiSearchOption didReceiveResult:(QMSPoiSearchResult *)poiSearchResult {
    NSLog(@"%@", poiSearchResult);
    
    if (poiSearchResult.count == 0) {
        return;
    }
    
    // 地图移动到搜索结果的第一个位置
    if (_searchBar.text.length > 0) {
        _selectedIndex = 0;
        QMSPoiData *firstData = poiSearchResult.dataArray[0];
        _annotation.coordinate = firstData.location;
        [self.mapView setCenterCoordinate:firstData.location animated:YES];
    } else {
        _selectedIndex = 0;  // 初始选中第一个
    }
    
    _searchResultArray = poiSearchResult.dataArray;
    [_searchResultTableView reloadData];
}

#pragma mark - SearchBar

- (void)setupSearchView {
    _searchView = [[UIView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 344, [UIScreen mainScreen].bounds.size.width, BM_SEARCH_BAR_HEIGHT + BM_TABLE_VIEW_HEIGHT)];
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

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self.view endEditing:YES];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self searchCurrentLocationWithKeyword:searchBar.text];
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
    
    QMSPoiData *data = _searchResultArray[indexPath.row];
    
    // 更新位置
    [self.mapView setCenterCoordinate:data.location animated:YES];
    
    [self.searchResultTableView reloadData];
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
        weakSelf.searchView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 344, weakSelf.searchView.bounds.size.width, 344);
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
