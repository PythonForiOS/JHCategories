//
//  UITableView-Extended.h
//  JH_Categories
//
//  Author: Jonathan Hosmer
//  Date: 9/19/11
//
//  Copyright 2011 Jonathan Hosmer
//  http://pythonforios.com
//

@interface UITableView (JH)

- (void)selectSelectededRow;
- (void)deselectSelectededRow;
- (void)selectRowAtIndex:(NSInteger)index;
- (void)deselectRowAtIndex:(NSInteger)index;
- (void)reloadRowAtIndexPath:(NSIndexPath *)indexPath;

@end
