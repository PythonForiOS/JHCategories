//
//  UITableView-Extended.m
//  JH_Categories
//
//  Author: Jonathan Hosmer
//  Date: 9/19/11
//
//  Copyright 2011 Jonathan Hosmer
//  http://pythonforios.com
//

#import "UITableView+JH.h"

@implementation UITableView (JH)

- (void)selectSelectededRow {
    NSIndexPath *ip = [NSIndexPath indexPathForRow:self.indexPathForSelectedRow.row inSection:self.indexPathForSelectedRow.section];
    if ([self.delegate respondsToSelector:@selector(tableView:willSelectRowAtIndexPath:)]) {
        [self.delegate tableView:self willSelectRowAtIndexPath:ip];
    }
    [self selectRowAtIndexPath:ip animated:YES scrollPosition:UITableViewScrollPositionNone];
    if ([self.delegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
        [self.delegate tableView:self didSelectRowAtIndexPath:ip];
    }
}

- (void)deselectSelectededRow {
    NSIndexPath *ip = [NSIndexPath indexPathForRow:self.indexPathForSelectedRow.row inSection:self.indexPathForSelectedRow.section];
    if ([self.delegate respondsToSelector:@selector(tableView:willDeselectRowAtIndexPath:)]) {
        [self.delegate tableView:self willDeselectRowAtIndexPath:ip];
    }
    [self deselectRowAtIndexPath:ip animated:YES];
    if ([self.delegate respondsToSelector:@selector(tableView:didDeselectRowAtIndexPath:)]) {
        [self.delegate tableView:self didDeselectRowAtIndexPath:ip];
    }
}

- (void)selectRowAtIndex:(NSInteger)index {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    if ([self.delegate respondsToSelector:@selector(tableView:willSelectRowAtIndexPath:)]) {
        [self.delegate tableView:self willSelectRowAtIndexPath:indexPath];
    }
    [self selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    if ([self.delegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
        [self.delegate tableView:self didSelectRowAtIndexPath:indexPath];
    }
}

- (void)deselectRowAtIndex:(NSInteger)index {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    if ([self.delegate respondsToSelector:@selector(tableView:willDeselectRowAtIndexPath:)]) {
        [self.delegate tableView:self willDeselectRowAtIndexPath:indexPath];
    }
    [self deselectRowAtIndexPath:indexPath animated:YES];
    if ([self.delegate respondsToSelector:@selector(tableView:didDeselectRowAtIndexPath:)]) {
        [self.delegate tableView:self didDeselectRowAtIndexPath:indexPath];
    }
}

- (void)reloadRowAtIndexPath:(NSIndexPath *)indexPath {
    [self reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
