

from abc import ABC, abstractmethod


class CoincapCrawler(ABC):

    @abstractmethod
    def get(self):
        pass
