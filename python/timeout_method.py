import time

TIMEOUT_DELAY = 0.2

def call_with_timeout(timeout, func, *args, **kwargs) -> bool:
    """
    Call a function with a timeout.

    Original function should return True or False.

    :param timeout: Timeout before defaulting to False in seconds
    :param function: Function to call
    :param *args: Arguments to pass to method
    :param **kwargs: Keyword arguments to pass to method
    :return: True if function returns True before timeout, False otherwise
    """
    for _ in range(timeout * TIMEOUT_DELAY ** -1):
        if func(*args, **kwargs):
            return True
        time.sleep(TIMEOUT_DELAY)
    return False
