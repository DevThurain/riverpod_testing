import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/legacy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_testing/core/logger/logs.dart';
import 'package:riverpod_testing/core/services/navigation/navigation_service.dart';
import 'package:riverpod_testing/core/utils/error_utils.dart';
import 'package:riverpod_testing/domain/models/failure.dart';
import 'package:riverpod_testing/features/global/dialogs/dialogs.dart';

extension WidgetRefExtension on WidgetRef {

  void easyListen<T>(
    ProviderListenable<AsyncValue<T>> provider, {
    bool handleLoading = true,
    bool handleError = true,
    void Function(T data)? whenData,
    void Function(Failure failure)? whenCustomError,
    VoidCallback? onRetry,
    VoidCallback? loadingDialogCallBack,
  }) {
    listen(provider, (prev, next) async {
      final isLoadingNotifier = read(isLoadingShowProvider.notifier);

      void showLoading() {
        if (!isLoadingNotifier.state) {
          isLoadingNotifier.state = true;
          loadingDialogCallBack == null ? Dialogs.showLoadingDialog(context) : loadingDialogCallBack() ;
        }
      }

      void hideLoading() {
        if (isLoadingNotifier.state) {
          isLoadingNotifier.state = false;
          NavigationService.popDialog(context);
        }
      }

      Future<void> handleErrorFn(Object err, StackTrace st) async {
        Logs.apiLogs.finer('catch error in easyListen ${err.toString()}', StackTrace.empty);

        hideLoading();

        await Future.delayed(const Duration(milliseconds: 400));
        if (context.mounted) {
          ErrorUtils.handleFailure(
            context: context,
            error: err,
            stackTrace: st,
            onRetry: onRetry ?? () {},
            onCustomError: whenCustomError,
          );
        }
      }

      void handleData(T data) {
        hideLoading();
        whenData?.call(data);
      }

      next.whenOrNull(
        loading: handleLoading ? showLoading : null,
        error: handleError ? (err, st) => handleErrorFn(err, st) : null,
        data: handleData,
      );

      // if neither loading nor error, ensure dialog is closed
      if (next is! AsyncLoading && next is! AsyncError) {
        hideLoading();
      }
    });
  }

}

final isLoadingShowProvider = StateProvider<bool>((ref) => false, name: 'isLoadingShowProvider');
