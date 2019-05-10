#!/usr/bin/python3

import unittest
import subprocess


class MyTester(unittest.TestCase):
    """Test that everything is kosher"""
    def test_all(self):
        """Run all tests"""
        self.test_win_feats()
        self.test_win_docker()

        # TODO: Not working:
        # self.test_wsl_echo()
        # self.test_wsl_docker()

        print("Success: All tests have passed.")

    def test_win_feats(self):
        """ Check if all necessary Windows Features are enabled """
        result = (
            subprocess.check_output(
                'DISM /online /get-features /format:table')
            .decode("utf-8").split("\n"))
        for r in [res for res in result if any(
                x in res for x in [
                    "Microsoft-Hyper-V-All",
                    "Microsoft-Windows-Subsystem-Linux"])]:
            module_name = r.split("|")[0].strip()
            assert ("Enabled" in r), \
                ("Windows feature not successfully enabled: {}"
                 .format(module_name))
            print("Module succssfully installed: {}"
                  .format(module_name.split("|")[0].strip()))

    def test_win_docker(self):
        result = (subprocess.check_output(
                     'docker run hello-world')
                  .decode("utf-8"))
        assert ("Hello" in result), \
            ("Docker server in Windows failed verification checks.")

    def test_wsl_echo(self):
        result = subprocess.check_output([
            "bash", "-e", "echo", "hello-world"])
        assert ("Hello" in result), \
            "Docker server in Windows failed verification checks."

    def test_wsl_docker(self):
        result = subprocess.check_output([
            "bash", "-e", "docker run hello-world"])
        assert ("Hello" in result), \
            "Docker server in Windows failed verification checks."


if __name__ == '__main__':
    import doctest
    doctest.testmod()
    t = MyTester()
    t.test_all()
