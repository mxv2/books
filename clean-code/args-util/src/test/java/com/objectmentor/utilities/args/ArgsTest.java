package com.objectmentor.utilities.args;

import org.junit.Assert;
import org.junit.Test;

public class ArgsTest {
    @Test
    public void testCreateArgs() throws Exception {
        String[] args = new String[]{"-l", "-p", "5000", "-d", "/app", "/srv"};
        Args argsParser = new Args("l,p#,d[*]", args);
        Assert.assertNotNull(argsParser);

        Assert.assertTrue(argsParser.has('l'));
        Assert.assertTrue(argsParser.has('p'));
        Assert.assertTrue(argsParser.has('d'));
    }
}
